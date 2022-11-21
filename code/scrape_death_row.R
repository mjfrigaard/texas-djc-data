# Scrape Texas Department of Criminal Justice website
scrape_death_row <- function() {
  webpage_url <- "http://www.tdcj.state.tx.us/death_row/dr_executed_offenders.html"
  webpage <- xml2::read_html(webpage_url)
  ExOffndrsRaw <- rvest::html_table(webpage)[[1]]
  ExOffndrsTbl <- tibble::as_tibble(x = ExOffndrsRaw, .name_repair = "unique")
  ExecutedOffenders <- janitor::clean_names(dat = ExOffndrsTbl, case = "snake")
  return(ExecutedOffenders)
}
