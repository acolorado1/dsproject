% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/make_project.R
\name{make_project}
\alias{make_project}
\title{Create new project in R studio}
\usage{
make_project(
  project,
  path = getwd(),
  folders = c("figures", "documentation", "data", "reports", "R"),
  readme = "README.md",
  git = FALSE
)
}
\arguments{
\item{project}{name of new project}

\item{path}{gets working directory unless user specifies otherwise}

\item{folders}{list of subdirectories called figures, documentation, data, reports, and R}

\item{readme}{creates a readme file}

\item{git}{creates a git repository for the new project should the user make parameter equal TRUE}
}
\value{
Returns a new project placed in the current working directory
}
\description{
User creates new project with name of their choosing
}
\details{
User can can create a new project, specify the directory its located in, create subdirectories, create a readme file, and specify whether or not they want a git repository
}
\examples{
\dontrun{make_project("newproject")}
}
