#=====================================================================#
# This is code to create: import executed offenders
# Authored by and feedback to: mjfrigaard
# MIT License
# Version: 1.0
#=====================================================================#

webpage_url <- "http://www.tdcj.state.tx.us/death_row/dr_executed_offenders.html"
webpage <- xml2::read_html(webpage_url)
ExOffndrsRaw <- rvest::html_table(webpage)[[1]]