#=====================================================================#
# This is code to create: import executed offenders
# Authored by and feedback to: mjfrigaard
# MIT License
# Version: 1.0
#=====================================================================#

webpage_url <- "http://www.tdcj.state.tx.us/death_row/dr_executed_offenders.html"
webpage <- xml2::read_html(webpage_url)
ExOffndrsRaw <- rvest::html_table(webpage)[[1]]
raw_data_path <-  paste0("data/raw/", 
                          noquote(lubridate::today()), 
                          "-ExOffndrsRaw.rds")

readr::write_rds(ExOffndrsRaw, raw_data_path)

## create Links ------------------------------------------------------------
Links <- webpage |>
  # this get the links in the overflow table
  # row
  rvest::html_nodes(".overflow tr") |>
  # the links
  rvest::html_nodes("a") |>
  # the header ref
  rvest::html_attr("href")

# export Links -----------------------------------------------------
raw_data_path <- paste0("data/raw/")
fs::dir_create(raw_data_path)
links_file_path <- paste0(raw_data_path, noquote(lubridate::today()), "-Links.rds")
readr::write_rds(Links, links_file_path)
fs::dir_tree(raw_data_path)
