#=====================================================================#
# This is code to create: tidy - ExecutedOffenders
# Authored by and feedback to: mjfrigaard
# MIT License
# Version: 1.0
#=====================================================================#


# pkgs --------------------------------------------------------------------
library(tidyverse)
library(skimr)
library(lubridate)
library(here)
library(janitor)
library(socviz)
library(ggrepel)
library(showtext)
library(hrbrthemes)

# source("code/01-import.R")
fs::dir_tree("data/raw")
ExOffndrsRaw <- readr::read_rds(file = "data/raw/2022-11-21-ExOffndrsRaw.rds")

# clean names ---
ExecutedOffenders <- ExOffndrsRaw |>
  # repair the repeated columns
  tibble::as_tibble(.name_repair = "unique") |>
  # get unique names
  janitor::clean_names(case = "snake") |>
  # lower, snake case
  dplyr::rename(offender_info = link_2,
    # rename these
    last_statement = link_3)

# glimpse(ExecutedOffenders)

# export ExecutedOffenders.rds --------------------------------------------
data_path <- paste0("data/", noquote(lubridate::today()), "/")
fs::dir_create(data_path)
data_file_path <- paste0(data_path, "ExecutedOffenders.rds")
readr::write_rds(ExecutedOffenders, data_file_path)



# LINKS -------------------------------------------------------------------
Links <- readr::read_rds("data/2022-11-21/Links.rds")

## check-links ------------------------------------------------------
# check Links
Links |> utils::head(20)

## length_vs_nrow---------------------------------------------------
length(Links)
nrow(ExecutedOffenders)


# OFFENDER LAST STATEMENT LINKS -----------------------------------
## last_pattern-----------------------------------------------------
last_pattern <- stringr::str_detect(string = Links,
  pattern = "last")
utils::head(Links[last_pattern])


## identical_last_pattern_ExOffndrs---------------------------------
base::identical(x = base::length(Links[last_pattern]),
  y = base::nrow(ExecutedOffenders))


## last_links-------------------------------------------------------
last_links <- Links[last_pattern]
last_links |> utils::head(10)


## check_lengths----------------------------------------------------
base::identical(x = base::length(last_links),
  y = base::nrow(ExecutedOffenders))


## add_last_links---------------------------------------------------
ExecutedOffenders |> glimpse()
# test
ExecutedOffenders |>
  dplyr::mutate(last_url =
      paste0("https://www.tdcj.texas.gov/death_row/",
        last_links)) |>
  dplyr::pull(last_url) |>
  utils::head(10) |>
  base::writeLines()
# assign
ExecutedOffenders <- ExecutedOffenders |>
  dplyr::mutate(last_url =
      paste0("https://www.tdcj.texas.gov/death_row/",
        last_links))


## tidy-last-links --------------------------------------
LastUrl <- last_links |>
  tibble::as_tibble(.name_repair =
      "unique") |>
  tidyr::pivot_longer(cols = value,
    names_to = "key",
    values_to = "value") |>
  dplyr::select(name_last_url = value) |>
  dplyr::mutate(name_last_url =
      paste0("https://www.tdcj.texas.gov/death_row/",
        last_links))
LastUrl$name_last_url |>
  utils::head() |>
  base::writeLines()


# OFFENDER INFORMATION LINKS ----------------------------------------------
## info_pattern-----------------------------------------------------
info_pattern <- !stringr::str_detect(string = Links,
  pattern = "last")
Links[info_pattern] |>
  utils::head() |>
  base::writeLines()


## identical_info_pattern_ExOffndrs---------------------------------
base::identical(x = base::length(Links[info_pattern]),
  y = base::nrow(ExecutedOffenders))


## info_links-------------------------------------------------------
info_links <- Links[info_pattern]
base::identical(x = base::length(info_links),
  y = base::nrow(ExecutedOffenders))


## create-info_url-death_row----------------------------------------
ExecutedOffenders |>
  dplyr::mutate(info_url =
      paste0("https://www.tdcj.texas.gov/death_row/",
        info_links)) |>
  dplyr::pull(last_url) |>
  utils::head(10) |>
  base::writeLines()
# assign
ExecutedOffenders <- ExecutedOffenders |>
  dplyr::mutate(info_url =
      paste0("http://www.tdcj.state.tx.us/death_row/",
        info_links))


## info_links-----------------------------------------------
info_links <- Links[info_pattern]
InfoLinks <- info_links |>
  # turn into a tibble
  tibble::as_tibble(.name_repair = "unique") |>
  # tidy
  tidyr::pivot_longer(cols = value,
    names_to = "key",
    values_to = "value") |>
  # rename the value
  dplyr::select(dr_info_url = value) |>
  # create the new url with death row root
  dplyr::mutate(dr_info_url = paste0("http://www.tdcj.state.tx.us/death_row/", info_links))
InfoLinks |> head()

## check_names_in_ExOffndrs-----------------------------------------
ExecutedOffenders |>
  dplyr::select(last_name,
    first_name) |>
  utils::head(10)


## check_last_names_in_ExOffndrs------------------------------------
ExecutedOffenders |>
  dplyr::select(last_name,
    first_name) |>
  utils::tail(10)


# COMBINE LAST STATEMENT & INFO LINKS -------------------------------------
## bind_cols_ExOffndrsComplete--------------------------------------
# Use `dplyr::bind_cols()` to attach these columns to `ExecutedOffenders` and
# rename to`ExOffndrsComplete`
ExecutedOffenders <- ExecutedOffenders |>
  # add the info_url
  dplyr::bind_cols(LastUrl) |>
  # add the
  dplyr::bind_cols(InfoLinks) |>
  # move the names to the front
  dplyr::select(dplyr::ends_with("name"),
    # all else
    dplyr::everything())
#


## ExecutedOffenders glimpse ----------------------------
ExecutedOffenders |> dplyr::glimpse(78)


## jpg_html---------------------------------------------------------
ExOffndrsComplete <- ExecutedOffenders |>
  dplyr::mutate(jpg_html =
      dplyr::case_when(
        str_detect(string = info_url, pattern = ".jpg") ~ "jpg",
        str_detect(string = info_url, pattern = ".html") ~ "html"
      ))


## jpg_html count ----------------------------------------------------
ExOffndrsComplete |> dplyr::count(jpg_html)


# EXPORT ----
## export to data/ -------------------------------------------------------
# # create raw folder
data_folder <- paste0("data/", noquote(lubridate::today()), "/")
fs::dir_create(data_folder)
executed_complete_csv_file <-
  paste0(data_folder, "ExecutedOffendersComplete.csv")
executed_complete_rds_file <-
  paste0(data_folder, "ExecutedOffendersComplete.rds")
vroom::vroom_write(x = ExOffndrsComplete, file = executed_complete_csv_file)
readr::write_rds(x = ExOffndrsComplete, file = executed_complete_rds_file)


# tree-export-all, eval=TRUE---------------------------------------
# verify
fs::dir_tree(data_folder, recurse = TRUE)
