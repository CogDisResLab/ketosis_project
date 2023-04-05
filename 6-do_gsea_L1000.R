# Complete modified Pathway Analysis for Ramaker extracted L1000 disease signatures

library(tidyverse)
library(fgsea)

files <- list.files("Ramaker_Disease_Signatures/L1000/", ".csv", recursive = TRUE, full.names = TRUE)

pathways <- readRDS("data/smita_hallmark_pathways.rds")

perform_gsea <- function(filepath) {

  message(paste("Processing", basename(filepath)))

  outfile_name <- filepath |>
    basename() |>
    str_replace("L1000", "gsea")

  outfile_path <- file.path(
    "results",
    "gsea",
    "ramaker_L1000",
    outfile_name
  )

  dge <- read_csv(filepath, show_col_types = FALSE) |>
    mutate(value = logFC * -log10(PValue)) |>
    select(gene_name, value) |>
    arrange(desc(value)) |>
    deframe()

  gsea <- fgsea(pathways, dge, minSize = 15, maxSize = 500, nPermSimple = 500000)

  gsea |>
    mutate(LEGenes = map_chr(leadingEdge, ~ str_c(.x, collapse = ", "))) |>
    select(-leadingEdge) |>
    write_csv(outfile_path)

  gsea

}


gseas <- files |>
  map(perform_gsea)

saveRDS(gseas, "results/gsea/ramaker.RDS")
