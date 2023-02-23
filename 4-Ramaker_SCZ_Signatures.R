#Generate SCZ disease signatures

library(tidyverse)
library(drugfindR)

# Read all MDD Female files
files <- list.files("Ramaker_Disease_Signatures/DGEs/SCZ/", "*.csv", full.names = TRUE, recursive = TRUE) |>
  keep(~ str_detect(.x, "female"))


# Female file 1: Anterior Cingulate (ancg) --------------------------------------
#Extract the gene name and LFC values from the female ancg brain region
dge_female_scz_ancg <- read_csv(files[1]) |>
  dplyr::select(gene_name, logFC) |>
  dplyr::rename(female = logFC)

# Extract the L1000 genes and LFC values for those genes from our file
dge_female_scz_ancg_L1000 <- dge_female_scz_ancg |>
  dplyr::select(gene_name, female) |>
  mutate(PValue = rep (0, nrow(dge_female_scz_ancg))) |>
  drugfindR::prepare_signature(gene_column = "gene_name", logfc_column = "female") |>
  dplyr::select(Name_GeneSymbol, female = Value_LogDiffExp) |>
  write_csv("Ramaker_Disease_Signatures/L1000/SCZ/dge_female_scz_ancg_L1000.csv")


# Female file 2: Dorsolateral Prefrontal Cortex (dlpfc) -------------------------
#Extract the gene name and LFC values from the female dlpfc brain region
dge_female_scz_dlpfc <- read_csv(files[2]) |>
  dplyr::select(gene_name, logFC) |>
  dplyr::rename(female = logFC)

# Extract the L1000 genes and LFC values for those genes from our file
dge_female_scz_dlpfc_L1000 <- dge_female_scz_dlpfc |>
  dplyr::select(gene_name, female) |>
  mutate(PValue = rep (0, nrow(dge_female_scz_dlpfc))) |>
  drugfindR::prepare_signature(gene_column = "gene_name", logfc_column = "female") |>
  dplyr::select(Name_GeneSymbol, female = Value_LogDiffExp) |>
  write_csv("Ramaker_Disease_Signatures/L1000/SCZ/dge_female_scz_dlpfc_L1000.csv")


# Female file 3: Nucleus Accumbens  (nacc) --------------------------------------
# Extract the gene name and LFC values from the female nacc brain region
dge_female_scz_nacc <- read_csv(files[3]) |>
  dplyr::select(gene_name, logFC) |>
  dplyr::rename(female = logFC)

# Extract the L1000 genes and LFC values for those genes from our file
dge_female_scz_nacc_L1000 <- dge_female_scz_nacc |>
  dplyr::select(gene_name, female) |>
  mutate(PValue = rep (0, nrow(dge_female_scz_nacc))) |>
  drugfindR::prepare_signature(gene_column = "gene_name", logfc_column = "female") |>
  dplyr::select(Name_GeneSymbol, female = Value_LogDiffExp) |>
  write_csv("Ramaker_Disease_Signatures/L1000/SCZ/dge_female_scz_nacc_L1000.csv")


# Read all BPD Male files
files <- list.files("Ramaker_Disease_Signatures/DGEs/SCZ/", "*.csv", full.names = TRUE, recursive = TRUE) |>
  keep(~ str_detect(.x, "female", negate = TRUE))


# Male file 1: Anterior Cingulate (ancg) --------------------------------------
# Extract the gene name and LFC values from the male ancg brain region
dge_male_scz_ancg <- read_csv(files[1]) |>
  dplyr::select(gene_name, logFC) |>
  dplyr::rename(male = logFC)

# Extract the L1000 genes and LFC values for those genes from our file
dge_male_scz_ancg_L1000 <- dge_male_scz_ancg |>
  dplyr::select(gene_name, male) |>
  mutate(PValue = rep (0, nrow(dge_male_scz_ancg))) |>
  drugfindR::prepare_signature(gene_column = "gene_name", logfc_column = "male") |>
  dplyr::select(Name_GeneSymbol, male = Value_LogDiffExp) |>
  write_csv("Ramaker_Disease_Signatures/L1000/SCZ/dge_male_scz_ancg_L1000.csv")


# Male file 2: Dorsolateral Prefrontal Cortex (dlpfc) -------------------------
# Extract the gene name and LFC values from the male dlpfc brain region
dge_male_scz_dlpfc <- read_csv(files[2]) |>
  dplyr::select(gene_name, logFC) |>
  dplyr::rename(male = logFC)

# Extract the L1000 genes and LFC values for those genes from our file
dge_male_scz_dlpfc_L1000 <- dge_male_scz_dlpfc |>
  dplyr::select(gene_name, male) |>
  mutate(PValue = rep (0, nrow(dge_male_scz_dlpfc))) |>
  drugfindR::prepare_signature(gene_column = "gene_name", logfc_column = "male") |>
  dplyr::select(Name_GeneSymbol, male = Value_LogDiffExp) |>
  write_csv("Ramaker_Disease_Signatures/L1000/SCZ/dge_male_scz_dlpfc_L1000.csv")


# Male file 3: Nucleus Accumbens  (nacc) --------------------------------------
# Extract the gene name and LFC values from the male naa brain region
dge_male_scz_nacc <- read_csv(files[3]) |>
  dplyr::select(gene_name, logFC) |>
  dplyr::rename(male = logFC)

# Extract the L1000 genes and LFC values for those genes from our file
dge_male_scz_nacc_L1000 <- dge_male_scz_nacc |>
  dplyr::select(gene_name, male) |>
  mutate(PValue = rep (0, nrow(dge_male_scz_nacc))) |>
  drugfindR::prepare_signature(gene_column = "gene_name", logfc_column = "male") |>
  dplyr::select(Name_GeneSymbol, male = Value_LogDiffExp) |>
  write_csv("Ramaker_Disease_Signatures/L1000/SCZ/dge_male_scz_nacc_L1000.csv")

