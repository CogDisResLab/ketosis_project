# Annotate the final genes with the original general pathway

library(tidyverse)
library(HGNChelper)

gene_list <- read_csv("results/combined_gene_list.csv") |>
  filter(str_detect(Datasets, "K")) |>
  select(Gene)

humans <- getCurrentHumanMap()

wikipathway <- read_csv("results/wikipathway_gene_list.csv") |>
  mutate(fixed = checkGeneSymbols(Gene, map = humans)) |>
  unnest_wider(fixed) |>
  select(Source_Sheet, Suggested.Symbol) |>
  rename(Gene = Suggested.Symbol) |>
  rename_with( ~ str_c("WP_", .x), -Gene)
bioplanet <- read_csv("results/bioplanet_gene_list.csv") |>
  mutate(fixed = checkGeneSymbols(Gene, map = humans)) |>
  unnest_wider(fixed) |>
  select(Source_Sheet, Suggested.Symbol) |>
  rename(Gene = Suggested.Symbol) |>
  rename_with( ~ str_c("BP_", .x), -Gene)
kegg <- read_csv("results/kegg_gene_list.csv") |>
  mutate(fixed = checkGeneSymbols(Gene, map = humans)) |>
  unnest_wider(fixed) |>
  select(Source_Sheet, Suggested.Symbol) |>
  rename(Gene = Suggested.Symbol) |>
  rename_with( ~ str_c("KEGG_", .x), -Gene)

combined <- gene_list |>
  inner_join(wikipathway) |>
  inner_join(bioplanet) |>
  inner_join(kegg) |>
  unique() |>
  pivot_longer(contains("Sheet"), names_to = "Source_DB", values_to = "Source_Pathway") |>
  mutate(Source_DB = str_remove(Source_DB, "_Source_Sheet")) |>
  pivot_wider(names_from = "Source_Pathway",
              values_from = "Source_DB",
              values_fn = ~ {
                .x |> unique() |> str_c(collapse = ", ")
              },
              values_fill = "")

combined |>
  write_csv("results/combined_annotated_source_pathway.csv")
