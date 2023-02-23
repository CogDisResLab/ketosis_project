# Pull the transcriptomic data from Kaleidoscope

library(tidyverse)
library(dotenv)
library(DBI)
library(RMariaDB)

dotenv::load_dot_env()

gene_list <- read_csv("results/combined_gene_list.csv") |>
  filter(Datasets == "WBK") |>
  pull(Gene)

DBI::dbConnect(drv = RMariaDB::MariaDB(),
                      dbname = "ksdatabase_new",
                      user = "khaled",
                      password = "JTV!zfn5wnp!qwf6vtd",
                      host = "ks-db.cuchmjp8ypgi.us-east-2.rds.amazonaws.com",
                      port = 3306
                      )
