# work flow file that manages inputs and outputs of other .R and .Rmd files

## packages
library(knitr)
library(markdown)

## directories
source("directories_pc.R")
source("formats.R")

## RMarkdown for Data Wrangling of raw .csv data file
rmarkdown::render(
  input = paste0(dir_programs, "\\GrCa HRI Data Wrangling.Rmd"),
  output_format = "html_document",
  output_dir = dir_reports
  )

# exploratory data analysis
rmarkdown::render(
  input = paste0(dir_programs, "\\GrCa HRI Exploratory Data Analysis.Rmd"),
  output_format = "html_document",
  output_dir = dir_reports
)
