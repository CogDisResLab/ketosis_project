# Extract all the pathways and deposit them in the respective directories

library(tidyverse)
library(readxl)

raw_file <- "raw/Smita Gene Lists for Enzymes.xlsx"

sheets <- excel_sheets(raw_file)

sheets_of_interest <- sheets |>
  keep( ~ str_detect(.x, "Initial", negate = TRUE))

sheet_names <- sheets_of_interest |>
  str_replace_all("[\\s|\\W]+", "-")

#sheet <- sheets_of_interest[1]

get_indices <- function(term_col) {
  data_start_indices <- term_col |>
    str_detect("Term") |>
    which()

  out <- list(
    bioplanet = c(data_start_indices[1] + 1, data_start_indices[2] - 2),
    wikipathways = c(data_start_indices[2] + 1, data_start_indices[3] - 2),
    kegg = c(data_start_indices[3] + 1, length(term_col))
  )

  out
}

extract_data <- function(dataset, database, boundaries, sheet_name) {
  dataset_rows <- dataset[boundaries[1]:boundaries[2], ]
  colnames(dataset_rows) <- dataset[boundaries[1] - 1,]

  data_out <- dataset_rows |>
    mutate(Source_Sheet = sheet_name,
           Source_DB = database)

  data_out
}


parse_sheet <- function(sheet, sheet_name) {
  sheet_raw <- read_excel(raw_file, sheet, col_names = FALSE)

  data_boundaries <- get_indices(sheet_raw$...1)

  parsed <- data_boundaries |>
    imap( ~ extract_data(sheet_raw, .y, .x, sheet_name))

  parsed
}

write_multiple_csvs <- function(multidata, prefix, directory) {
  multidata |>
    imap(~ write.csv(.x, file.path(
      directory,
      str_glue(
        "{prefix}_{.y}_pathways.csv"
      )
    )))
  multidata
}


parsed_sheets <- sheets_of_interest |>
  set_names(sheet_names) |>
  imap(~ parse_sheet(.x, .y)) |>
  imap(~ write_multiple_csvs(.x, .y, file.path("data", "cached_data")))

bioplanet <- parsed_sheets |>
  map_dfr(~ pluck(.x, "bioplanet")) |>
  write_csv(file.path("data", "bioplanet_results.csv"))

wikipathways <- parsed_sheets |>
  map_dfr(~ pluck(.x, "wikipathways")) |>
  write_csv(file.path("data", "wikipathways_results.csv"))

kegg <- parsed_sheets |>
  map_dfr(~ pluck(.x, "kegg")) |>
  write_csv(file.path("data", "kegg_results.csv"))
