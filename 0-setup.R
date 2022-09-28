# Create the Directory Structure


create_dir <- function(dir) {
  dir.create(dir, showWarnings = FALSE, recursive = TRUE)
}

data_dir <- "data"
cached_data <- file.path(data_dir, "cached_data")
figures_dir <- "figures"
results_dir <- "results"

dirs <- c(cached_data, figures_dir, results_dir)

sapply(dirs, create_dir)
