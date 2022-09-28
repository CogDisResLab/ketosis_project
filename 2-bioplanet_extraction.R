# Process the bioplanet results

library(tidyverse)

bioplanet <- read_csv("data/bioplanet_results.csv")

bioplanet_source <- read_csv("https://tripod.nih.gov/bioplanet/download/pathway.csv") |>
  rename(Term = PATHWAY_NAME,
         ID = PATHWAY_ID,
         Gene = GENE_SYMBOL) |>
  select(-GENE_ID) |>
  inner_join(bioplanet) |>
  select(Term, ID, Source_Sheet, Source_DB, Gene) |>
  unique() |>
  write_csv(file.path("results", "bioplanet_gene_list.csv"))
