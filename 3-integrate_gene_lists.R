# Integrate all three results to create a unified list of genes

library(tidyverse)
library(HGNChelper)

wikipathway <- read_csv("results/wikipathway_gene_list.csv")
bioplanet <- read_csv("results/bioplanet_gene_list.csv")
kegg <- read_csv("results/kegg_gene_list.csv")

humans <- getCurrentHumanMap()

wikipathway_clean <- wikipathway |>
  mutate(WikiPathway = 1) |>
  select(WikiPathway, Gene) |>
  unique()

kegg_clean <- kegg |>
  mutate(KEGG = 1) |>
  select(KEGG, Gene) |>
  unique()

bioplanet_clean <- bioplanet |>
  mutate(BioPlanet = 1) |>
  select(BioPlanet, Gene) |>
  unique()

combined <- wikipathway_clean |>
  full_join(kegg_clean) |>
  full_join(bioplanet_clean) |>
  unique() |>
  select(Gene, WikiPathway, BioPlanet, KEGG) |>
  mutate(across(where(is.numeric), ~ if_else(is.na(.x), 0, .x)),
         fixed = checkGeneSymbols(Gene, map = humans)) |>
  unnest_wider(fixed) |>
  select(Suggested.Symbol, WikiPathway, BioPlanet, KEGG) |>
  rename(Gene = Suggested.Symbol) |>
  write_csv(file.path("results", "combined_gene_list.csv"))
