# Process the wikipathway dataset

library(tidyverse)
library(rWikiPathways)
library(BridgeDbR)

wikipathways <- read_csv("data/wikipathways_results.csv")

hugo_code <- getSystemCode("HGNC")

vector_getXRef <- Vectorize(getXrefList)

extracted_pathway_ids <- wikipathways |>
  select(Term) |>
  mutate(ID = {str_extract(Term, "WP\\d+") |> str_trim()}) |>
  unique() |>
  mutate(Gene = vector_getXRef(ID, hugo_code)) |>
  unnest_longer(Gene) |>
  inner_join(wikipathways, by = "Term") |>
  select(Term, ID, Source_Sheet, Source_DB, Gene) |>
  unique() |>
  write_csv(file.path("results", "wikipathway_gene_list.csv"))
