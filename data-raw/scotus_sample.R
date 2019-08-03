## code to prepare `scotus_sample` dataset goes here
# Data from https://github.com/brianwc/bulk_scotus
library(rvest)
library(rjson)
library(tidyverse)
library(fs)
set.seed(1234)

temp_file <- fs::file_temp()
temp_path <- fs::path_temp()

download.file("https://github.com/brianwc/bulk_scotus/archive/master.zip",
              temp_file)

untar(temp_file, exdir = temp_path)

cases <- dir_ls(path(temp_path, "bulk_scotus-master"), regexp = "[0-9]{4}s$")

cases_all <- cases %>%
  dir_ls(recurse = TRUE, type = "file")

null_swap <- function(x) ifelse(is.null(x), NA, x)

text_extraction <- function(x) {
  found <- FALSE
  if (!is.null(x$html) && x$html != "") {
    text <- x$html
    found <- TRUE
  }
  if (!is.null(x$html_with_citations) && !found && x$html_with_citations != "") {
    text <- x$html_with_citations
    found <- TRUE
  }
  if (!is.null(x$html_lawbox) && !found && x$html_lawbox != "") {
    text <- x$html_lawbox
    found <- TRUE
  }
  if (!found) {
    return(x$plain_text)
  }
  read_html(text) %>%
    html_nodes("p:not(.case_cite):not(.parties):not(.court):not(.date)") %>%
    html_text() %>%
    paste(collapse = "\n")
}

case_to_tibble <- function(x) {
  data <- fromJSON(file = x)
  tibble(
    year = str_extract(x, "/[0-9]{4}/") %>% str_extract("[0-9]{4}"),
    case_name = null_swap(data$citation$case_name),
    docket_number = null_swap(data$citation$docket_number),
    id = null_swap(data$citation$id),
    text = text_extraction(data)
  )
}

scotus_sample <- cases_all %>%
  map(safely(case_to_tibble)) %>%
  map_dfr("result") %>%
  filter(text != "") %>%
  sample_frac(0.1)

usethis::use_data(scotus_sample)

fs::file_delete(temp_file)
fs::dir_delete(temp_path)
