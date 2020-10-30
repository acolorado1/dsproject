#' @title Create new project in R studio
#'
#' @description User creates new project with name of their choosing
#' @details User can can create a new project, specify the directory its located in, create subdirectories, create a readme file, and specify whether or not they want a git repository
#'
#' @param project name of new project
#' @param path gets working directory unless user specifies otherwise
#' @param folders list of subdirectories called figures, documentation, data, reports, and R
#' @param readme creates a readme file
#' @param git creates a git repository for the new project should the user make parameter equal TRUE
#' @import usethis
#' @export
#' @return Returns a new project placed in the current working directory
#' @examples
#' \dontrun{ make_project("newproject")}
make_project <- function (project,
                  path = getwd(),
                  folders = c("figures", "documentation",
                              "data", "reports", "R"),
                  readme = "README.md",
                  git = FALSE) {


  # change to path location
  if(!dir.exists(path)) stop("No such path")
  setwd(path)

  # project directory
  if(!missing(project)) {
    dir.create(project)
    setwd(project)
  }

  # create subdirectories
  for (i in folders){
    dir.create(i)
  }


  # create README.md
  today <- Sys.Date()
  user  <- Sys.info()[["user"]]
  project <- basename(getwd())
  cat("# Project: ", project, "\n\n",
      "## Author: ", user, "\n\n",
      "## Date: ",   format(today, format="%B %d %Y"), "\n\n",
      "## Purpose: \n\n",
      "## Data Sources: \n\n",
      "## Stakeholders: \n\n",
      file = readme,
      sep = "")

  # create RStudio project
  usethis::create_project(".", open=FALSE)

  # add git
  if (git){
     usethis::use_git()
  }


  # activate project
  usethis::proj_activate(".")

}
