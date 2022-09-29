# Process the KEGG Pathway results

library(tidyverse)
library(httr)
library(xml2)

pathway_list <-
  read_tsv("https://rest.kegg.jp/list/pathway/hsa",
           col_names = c("ID", "Term")) |>
  mutate(Term = str_remove(Term, "\\s-.*"),
    across(everything(), ~ str_trim(.x)))

format_url <- function(pathway) {
  str_glue("https://rest.kegg.jp/get/{pathway}/kgml")
}

get_result <- function(pathway) {
  url <- format_url(pathway)

  res <- GET(url)

  if (status_code(res) == 200) {
    content(res, as = "text")
  } else {
    '<?xml version="1.0"?>
<!DOCTYPE pathway SYSTEM "https://www.kegg.jp/kegg/xml/KGML_v0.7.2_.dtd">
    <pathway></pathway>'
  }
}

v_get_result <- Vectorize(get_result)

parse_result <- function(result) {
  result |>
    read_xml() |>
    xml_find_all('/pathway/entry[@type="gene"]/graphics') |>
    xml_attr("name") |>
    str_split(",", simplify = TRUE) |>
    as_tibble(.name_repair = NULL) |>
    pull(V1)
}

v_parse_result <- Vectorize(parse_result)

kegg <- read_csv("data/kegg_results.csv") |>
  inner_join(pathway_list) |>
  mutate(Gene = {v_get_result(ID) |> v_parse_result()}) |>
  select(Term, ID, Source_Sheet, Source_DB, Gene) |>
  unnest_longer(Gene) |>
  unique() |>
  write_csv(file.path("results", "kegg_gene_list.csv"))
