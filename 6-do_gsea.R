# Complete modified Pathway Analysis

library(tidyverse)
library(fgsea)

files <- list.files("Ramaker_Disease_Signatures/DGEs/", ".csv", recursive = TRUE, full.names = TRUE)

pathways <- readRDS("data/smita_hallmark_pathways.rds")

perform_gsea <- function(filepath) {

  message(paste("Processing", basename(filepath)))

  outfile_name <- filepath |>
    basename() |>
    str_replace("dge", "gsea")

  outfile_path <- file.path(
    "results",
    "gsea",
    "ramaker",
    outfile_name
  )

  dge <- read_csv(filepath, show_col_types = FALSE) |>
    mutate(value = logFC * -log10(PValue)) |>
    select(gene_name, value) |>
    arrange(desc(value)) |>
    deframe()

  gsea <- fgsea(pathways, dge, minSize = 15, maxSize = 500, nPermSimple = 50000)

  gsea |>
    write_csv(outfile_path)

  gsea

}

gseas <- files |>
  map(perform_gsea)
