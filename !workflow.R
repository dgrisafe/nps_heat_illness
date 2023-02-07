# work flow file that manages inputs and outputs of other .R and .Rmd files

## packages
library(knitr)
library(markdown)

## directories
source("directories_pc.R")
source("formats.R")

## Rmd analysis
rmarkdown::render(
  input = paste0(dir_programs, "\\HRI Grand Canyon.Rmd"),
  output_format = "html_document",
  output_dir = dir_reports
  )
