#' @title
#' Extended processing features for package DESCRIPTION files
#'
#' @description
#' Combines processing of DESCRIPTION files of loaded packages
#' with those of package projects.
#' This package is a fundamental building block of the \code{rapp} framework
#' and its associated higher level packages.
#' 
#' @seealso The core functions/methods of this package: 
#'    \itemize{
#'      \item{\code{\link[rapp.core.description]{getPackageDescription}}: }{
#'          Supports reading content of a package's \code{DESCRIPTION} file
#'          regardless if the input corresponds to the directory path of a 
#'          package project (see package \code{\link{devtools}}) or to the 
#'          name of a loaded package.
#'      }
#'      \item{\code{\link[rapp.core.description]{getPackageName}}: }{
#'          Simplifies the retrieval of the package name as specified in
#'          a package's \code{DESCRIPTION} file.
#'      }
#'      \item{\code{\link[rapp.core.description]{getPackageVersion}}: }{
#'          Simplifies the retrieval of the package version as specified in
#'          a package's \code{DESCRIPTION} file.
#'      }
#'      \item{\code{\link[rapp.core.description]{getPackageDependencies}}: }{
#'          Simplifies the retrieval of the different types of package dependencies 
#'          (global dependencies, imported dependencies, suggested dependencies)
#'          as specified in a package's \code{DESCRIPTION} file.
#'      }
#'    }
#' @template author
#' @template references
#' @docType package
#' @name rapp.core.description
NULL
