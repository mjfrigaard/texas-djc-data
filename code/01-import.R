#=====================================================================#
# This is code to create: import executed offenders
# Authored by and feedback to: mjfrigaard
# MIT License
# Version: 1.0
#=====================================================================#

## ----setup, include = FALSE--------------------------------------------------------------------------------
library(tidyverse)
library(skimr)
library(lubridate)
library(here)
library(janitor)
library(socviz)
library(ggrepel)
library(showtext)
library(hrbrthemes)
# create data folder




## ----webpage, eval=FALSE-----------------------------------------------------------------------------------
## webpage_url <- "http://www.tdcj.state.tx.us/death_row/dr_executed_offenders.html"
## webpage <- xml2::read_html(webpage_url)


## ----create-ExOffndrsRaw, eval=FALSE-----------------------------------------------------------------------
## ExOffndrsRaw <- rvest::html_table(webpage)[[1]]


## ----readr-ExOffndrsRaw, eval=FALSE------------------------------------------------------------------------
## raw_inst_path <-  paste0("data/raw/",
##                           noquote(lubridate::today()),
##                           "-ExOffndrsRaw.rds")
## readr::write_rds(ExOffndrsRaw, raw_inst_path)


## ----re-read-ExOffndrsRaw, eval=TRUE-----------------------------------------------------------------------
ExOffndrsRaw <- readr::read_rds(
  file = "../data/raw/2022-11-21-ExOffndrsRaw.rds")


## ----glimpse_table, eval=TRUE------------------------------------------------------------------------------
# check the data.frame
ExOffndrsRaw |> dplyr::glimpse(78)


## ----ExecutedOffenders, message=FALSE, echo=TRUE, error=TRUE, eval=FALSE-----------------------------------
## ExecutedOffenders <- rvest::html_table(webpage)[[1]] |>
##   # repair the repeated columns
##   tibble::as_tibble(.name_repair = "unique") |>
##   # get unique names
##   janitor::clean_names(case = "snake") |>
##   # lower, snake case
##   dplyr::rename(offender_info = link_2,
##                 # rename these
##                 last_statement = link_3)


## ----export-ExecutedOffenders, eval=FALSE------------------------------------------------------------------
## data_path <- paste0("../data/", noquote(lubridate::today()), "/")
## fs::dir_create(data_path)
## data_file_path <- paste0(data_path, "ExecutedOffenders.rds")
## readr::write_rds(ExecutedOffenders, data_file_path)


## ---- eval=TRUE--------------------------------------------------------------------------------------------
fs::dir_tree("../data/", regexp = "2022-11-21")


## ----re-read-ExecutedOffenders, eval=TRUE------------------------------------------------------------------
ExecutedOffenders <- readr::read_rds(
  file = "../data/2022-11-21/ExecutedOffenders.rds")


## ----glimpse-ExecutedOffenders, eval=TRUE------------------------------------------------------------------
ExecutedOffenders |> glimpse(78)


## ----scrape_death_row, eval=FALSE--------------------------------------------------------------------------
## scrape_death_row <- function() {
##   webpage_url <- "http://www.tdcj.state.tx.us/death_row/dr_executed_offenders.html"
##   webpage <- xml2::read_html(webpage_url)
##   ExOffndrsRaw <- rvest::html_table(webpage)[[1]]
##   ExOffndrsTbl <- tibble::as_tibble(x = ExOffndrsRaw, .name_repair = "unique")
##   ExOffndrsNms <- janitor::clean_names(dat = ExOffndrsTbl, case = "snake")
##   ExecutedOffenders <- purrr::set_names(x = ExOffndrsNms,
##                           nm = c("execution", "offender_info", "last_statement",
##                                 "last_name", "first_name", "tdcj_number",
##                                 "age", "date", "race", "county"))
##   return(ExecutedOffenders)
## }


## ----selector_gadget, out.width='70%', echo=FALSE, eval=TRUE-----------------------------------------------
knitr::include_graphics("../results/figures/selector_gadget.png")


## ----Links-------------------------------------------------------------------------------------------------
Links <- webpage |> 
  # this get the links in the overflow table 
  # row
  rvest::html_nodes(".overflow tr") |> 
  # the links
  rvest::html_nodes("a") |> 
  # the header ref
  rvest::html_attr("href")


## ----import-Links------------------------------------------------------------------------------------------
data_path <- paste0("../data/", noquote(lubridate::today()), "/")
fs::dir_create(data_path)
links_file_path <- paste0(data_path, "Links.rds")
readr::write_rds(Links, links_file_path)


## ---- eval=TRUE--------------------------------------------------------------------------------------------
fs::dir_tree("../data/", regexp = "2022-11-21")


## ----re-read-Links, eval=TRUE------------------------------------------------------------------------------
Links <- readr::read_rds("../data/2022-11-21/Links.rds")


## ----check-links-------------------------------------------------------------------------------------------
# check Links
Links |> utils::head(20)


## ----length_vs_nrow----------------------------------------------------------------------------------------
length(Links)
nrow(ExecutedOffenders)


## ----last_pattern------------------------------------------------------------------------------------------
last_pattern <- stringr::str_detect(
                            string = Links, 
                            pattern = "last")
utils::head(Links[last_pattern])


## ----identical_last_pattern_ExOffndrs----------------------------------------------------------------------
base::identical(
  x = base::length(Links[last_pattern]), 
  y = base::nrow(ExecutedOffenders))


## ----last_links--------------------------------------------------------------------------------------------
last_links <- Links[last_pattern]
last_links |> utils::head(10)


## ----check_lengths-----------------------------------------------------------------------------------------
base::identical(x = base::length(last_links),
                y = base::nrow(ExecutedOffenders))


## ----add_last_links----------------------------------------------------------------------------------------
ExecutedOffenders |> glimpse()


## ----mutate_last_url---------------------------------------------------------------------------------------
# test 
ExecutedOffenders |> 
  dplyr::mutate(
    last_url = 
        paste0("https://www.tdcj.texas.gov/death_row/", 
                                  last_links)) |> 
  dplyr::pull(last_url) |> 
  utils::head(10) |> 
  base::writeLines()
# assign
ExecutedOffenders <- ExecutedOffenders |> 
  dplyr::mutate(
    last_url = 
        paste0("https://www.tdcj.texas.gov/death_row/", 
                                  last_links))


## ----tidy-last-links, echo=FALSE---------------------------------------------------------------------------
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


## ----open-death-row-html, eval=FALSE-----------------------------------------------------------------------
## xopen("https://www.tdcj.texas.gov/death_row/dr_info/swearingenlarrylast.html")


## ----info_pattern------------------------------------------------------------------------------------------
info_pattern <- !stringr::str_detect(
                            string = Links, 
                            pattern = "last")
Links[info_pattern] |> 
  utils::head() |> 
  base::writeLines()


## ----identical_info_pattern_ExOffndrs----------------------------------------------------------------------
base::identical(x = base::length(Links[info_pattern]), 
                y = base::nrow(ExecutedOffenders))


## ----info_links--------------------------------------------------------------------------------------------
info_links <- Links[info_pattern]
base::identical(x = base::length(info_links),
                y = base::nrow(ExecutedOffenders))


## ----create-info_url-death_row-----------------------------------------------------------------------------
ExecutedOffenders |> 
  dplyr::mutate(
    info_url = 
        paste0("https://www.tdcj.texas.gov/death_row/", 
                                  info_links)) |> 
  dplyr::pull(last_url) |> 
  utils::head(10) |> 
  base::writeLines()
# assign
ExecutedOffenders <- ExecutedOffenders |> 
  dplyr::mutate(
    info_url = 
        paste0("http://www.tdcj.state.tx.us/death_row/", 
                                  info_links))


## ----info_links-no-eval------------------------------------------------------------------------------------
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
  dplyr::mutate(
    dr_info_url = paste0("http://www.tdcj.state.tx.us/death_row/", info_links))


## ----------------------------------------------------------------------------------------------------------
InfoLinks |> head()


## ----xopen-test, eval=FALSE--------------------------------------------------------------------------------
## xopen("http://www.tdcj.state.tx.us/death_row/dr_info/chanthakoummanekosoul.html")


## ----check_names_in_ExOffndrs------------------------------------------------------------------------------
ExecutedOffenders |> 
  dplyr::select(last_name, 
                first_name) |>
  utils::head(10)


## ----check_last_names_in_ExOffndrs-------------------------------------------------------------------------
ExecutedOffenders |> 
  dplyr::select(last_name, 
                first_name) |>
  utils::tail(10)


## ----bind_cols_ExOffndrsComplete---------------------------------------------------------------------------
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



## ----------------------------------------------------------------------------------------------------------
ExecutedOffenders |> dplyr::glimpse(78)


## ----jpg_html----------------------------------------------------------------------------------------------
ExOffndrsComplete <- ExecutedOffenders |> 
  dplyr::mutate(jpg_html = 
        dplyr::case_when(
          str_detect(string = info_url, pattern = ".jpg") ~ "jpg", 
          str_detect(string = info_url, pattern = ".html") ~ "html")) 


## ----------------------------------------------------------------------------------------------------------
ExOffndrsComplete |> dplyr::count(jpg_html)


## ----export-raw--------------------------------------------------------------------------------------------
# create raw folder
fs::dir_create("../data/raw/")
raw_data_folder <- paste0("../data/raw/", noquote(lubridate::today()), "/")
fs::dir_create(
    raw_data_folder
  )


## ----export-executed_raw_file------------------------------------------------------------------------------
# create export path
executed_csv_file <- paste0(raw_data_folder, "ExecutedOffenders.csv")
executed_raw_csv_file <- paste0(raw_data_folder, "RawExecutedOffenders.csv")
executed_complete_csv_file <- paste0(raw_data_folder, "ExecutedOffendersComplete.csv")
# export
vroom::vroom_write(x = ExecutedOffenders, file = executed_csv_file)
vroom::vroom_write(x = ExOffndrsRaw, file = executed_raw_csv_file)
vroom::vroom_write(x = ExOffndrsComplete, file = executed_complete_csv_file)


## ----tree-export-all, eval=TRUE----------------------------------------------------------------------------
# verify
fs::dir_tree("../data/raw/", recurse = TRUE)

