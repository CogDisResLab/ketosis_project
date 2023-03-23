# Genes Unique to each pathway

library(tidyverse)
library(HGNChelper)

humans <- getCurrentHumanMap()

kegg <- read_csv("results/kegg_gene_list.csv") |>
  mutate(fixed = checkGeneSymbols(Gene, map = humans)) |>
  unnest_wider(fixed) |>
  select(Source_Sheet, Gene = Suggested.Symbol) |>
  unique()

kegg_flipped <- kegg |>
  mutate(value = 1) |>
  pivot_wider(names_from = Gene, values_fill = 0) |>
  column_to_rownames("Source_Sheet") |>
  as.matrix()


uniques <- colSums(kegg_flipped) == 1

kegg_selected <- kegg_flipped[,uniques] |>
  as.data.frame() |>
  rownames_to_column("Pathway") |>
  pivot_longer(-Pathway) |>
  filter(value != 0) |>
  write_csv("results/pathway_unique_genes.csv")
