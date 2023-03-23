# Run GSEA on Hallmark + Smita Genes

library(fgsea)
library(tidyverse)
library(readxl)

standardize_name <- function(name) {
  modified <- name |>
    str_to_upper() |>
    str_replace_all(" ", "_") |>
    str_replace_all("-", "_") |>
    str_replace_all("\\+", "AND")
  str_c("SMITA", modified, sep = "_")
}

hallmark <- gmtPathways("raw/h.all.v2023.1.Hs.symbols.gmt")

smita_unique <- read_excel("raw/pathway_unique_genes.xlsx", sheet = "pathway_unique_genes") |>
  select(-value, -uniqueID) |>
  mutate(Pathway = standardize_name(Pathway))

smita_curated <- read_excel("raw/pathway_unique_genes.xlsx", sheet = "Smita Manual Genes") |>
  select(Pathway, name = `Gene Symbol`) |>
  mutate(Pathway = standardize_name(Pathway))

smita_genes <- bind_rows(smita_unique, smita_curated) |>
  split(~ Pathway) |>
  map(~ pull(.x, name))

combined_pathways <- unlist(list(hallmark, smita_genes), recursive = FALSE)

saveRDS(combined_pathways, file = "data/smita_hallmark_pathways.rds")
