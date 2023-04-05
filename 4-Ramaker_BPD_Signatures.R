#Generate BPD disease signatures

library(tidyverse)
library(drugfindR)

# Read all BPD Female files
files <- list.files("Ramaker_Disease_Signatures/DGEs/BPD/", "*.csv", full.names = TRUE, recursive = TRUE) |>
  keep(~ str_detect(.x, "female"))


# Female file 1: Anterior Cingulate (ancg) --------------------------------------
#Extract the gene name and LFC values from the female ancg brain region
dge_female_bpd_ancg <- read_csv(files[1]) |>
  dplyr::select(gene_name, logFC) |>
  dplyr::rename(LFC = logFC)

# Extract the L1000 genes and LFC values for those genes from our file
dge_female_bpd_ancg_L1000 <- dge_female_bpd_ancg |>
  dplyr::select(gene_name, LFC) |>
  mutate(PValue = rep (0, nrow(dge_female_bpd_ancg))) |>
  drugfindR::prepare_signature(gene_column = "gene_name", logfc_column = "LFC") |>
  dplyr::select(Name_GeneSymbol, LFC = Value_LogDiffExp) |>
  write_csv("Ramaker_Disease_Signatures/L1000/BPD/dge_female_bpd_ancg_L1000.csv")


# Female file 2: Dorsolateral Prefrontal Cortex (dlpfc) -------------------------
#Extract the gene name and LFC values from the female dlpfc brain region
dge_female_bpd_dlpfc <- read_csv(files[2]) |>
  dplyr::select(gene_name, logFC) |>
  dplyr::rename(LFC = logFC)

# Extract the L1000 genes and LFC values for those genes from our file
dge_female_bpd_dlpfc_L1000 <- dge_female_bpd_dlpfc |>
  dplyr::select(gene_name, LFC) |>
  mutate(PValue = rep (0, nrow(dge_female_bpd_dlpfc))) |>
  drugfindR::prepare_signature(gene_column = "gene_name", logfc_column = "LFC") |>
  dplyr::select(Name_GeneSymbol, LFC = Value_LogDiffExp) |>
  write_csv("Ramaker_Disease_Signatures/L1000/BPD/dge_female_bpd_dlpfc_L1000.csv")


# Female file 3: Nucleus Accumbens  (nacc) --------------------------------------
# Extract the gene name and LFC values from the female nacc brain region
dge_female_bpd_nacc <- read_csv(files[3]) |>
  dplyr::select(gene_name, logFC) |>
  dplyr::rename(LFC = logFC)

# Extract the L1000 genes and LFC values for those genes from our file
dge_female_bpd_nacc_L1000 <- dge_female_bpd_nacc |>
  dplyr::select(gene_name, LFC) |>
  mutate(PValue = rep (0, nrow(dge_female_bpd_nacc))) |>
  drugfindR::prepare_signature(gene_column = "gene_name", logfc_column = "LFC") |>
  dplyr::select(Name_GeneSymbol, LFC = Value_LogDiffExp) |>
  write_csv("Ramaker_Disease_Signatures/L1000/BPD/dge_female_bpd_nacc_L1000.csv")


# Read all BPD Male files
files <- list.files("Ramaker_Disease_Signatures/DGEs/BPD/", "*.csv", full.names = TRUE, recursive = TRUE) |>
  keep(~ str_detect(.x, "female", negate = TRUE))


# Male file 1: Anterior Cingulate (ancg) --------------------------------------
# Extract the gene name and LFC values from the male ancg brain region
dge_male_bpd_ancg <- read_csv(files[1]) |>
  dplyr::select(gene_name, logFC) |>
  dplyr::rename(LFC = logFC)

# Extract the L1000 genes and LFC values for those genes from our file
dge_male_bpd_ancg_L1000 <- dge_male_bpd_ancg |>
  dplyr::select(gene_name, LFC) |>
  mutate(PValue = rep (0, nrow(dge_male_bpd_ancg))) |>
  drugfindR::prepare_signature(gene_column = "gene_name", logfc_column = "LFC") |>
  dplyr::select(Name_GeneSymbol, LFC = Value_LogDiffExp) |>
  write_csv("Ramaker_Disease_Signatures/L1000/BPD/dge_male_bpd_ancg_L1000.csv")


# Male file 2: Dorsolateral Prefrontal Cortex (dlpfc) -------------------------
# Extract the gene name and LFC values from the male dlpfc brain region
dge_male_bpd_dlpfc <- read_csv(files[2]) |>
  dplyr::select(gene_name, logFC) |>
  dplyr::rename(LFC = logFC)

# Extract the L1000 genes and LFC values for those genes from our file
dge_male_bpd_dlpfc_L1000 <- dge_male_bpd_dlpfc |>
  dplyr::select(gene_name, LFC) |>
  mutate(PValue = rep (0, nrow(dge_male_bpd_dlpfc))) |>
  drugfindR::prepare_signature(gene_column = "gene_name", logfc_column = "LFC") |>
  dplyr::select(Name_GeneSymbol, LFC = Value_LogDiffExp) |>
  write_csv("Ramaker_Disease_Signatures/L1000/BPD/dge_male_bpd_dlpfc_L1000.csv")


# Male file 3: Nucleus Accumbens  (nacc) --------------------------------------
# Extract the gene name and LFC values from the male naa brain region
dge_male_bpd_nacc <- read_csv(files[3]) |>
  dplyr::select(gene_name, logFC) |>
  dplyr::rename(LFC = logFC)

# Extract the L1000 genes and LFC values for those genes from our file
dge_male_bpd_nacc_L1000 <- dge_male_bpd_nacc |>
  dplyr::select(gene_name, LFC) |>
  mutate(PValue = rep (0, nrow(dge_male_bpd_nacc))) |>
  drugfindR::prepare_signature(gene_column = "gene_name", logfc_column = "LFC") |>
  dplyr::select(Name_GeneSymbol, LFC = Value_LogDiffExp) |>
  write_csv("Ramaker_Disease_Signatures/L1000/BPD/dge_male_bpd_nacc_L1000.csv")

