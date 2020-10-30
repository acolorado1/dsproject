#' @title Import new data sets
#'
#' @description Imports data sets into R
#' @details Can import files of multiple type into the global environment.
#'
#' @param file name of file
#' @param ... extra specification for file import
#' @import tools, haven, readxl, vroom
#' @seealso \code{\link{haven}}
#' @export
#' @return a data set in the environment
#' @examples \dontrun{import("C:/Users/ascol/Downloads/testdata.csv")}
import <- function(file, ...){

  # if no file specified, prompt user

  if(missing(file))
    file <- file.choose()


  # get file info

  file <- tolower(file)
  basename <- basename(file)
  extension <- tools::file_ext(file)


  # import dataset

  df <- switch(extension,
           "sas7bdat" = haven::read_sas(file, ...),
           "dta" = haven::read_stata(file, ...),
           "sav" = haven::read_spss(file, ...),
           "xlsx" = readxl::read_excel(file, ...),
           "xls" = readxl::read_excel(file, ...),
           vroom::vroom(file, ...)
           )

  # return data frame
  return(df)
}

