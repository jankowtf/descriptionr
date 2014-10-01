#' @title
#' Processing of package DESCRIPTION files
#'
#' @description
#' Combines \code{DESCRIPTION} file processing features for \emph{work-in-progress}
#' package projects (offered by package \code{\href{http://cran.r-project.org/web/packages/devtools/index.html}{devtools}}) with features for 
#' doing the same for \emph{loaded} packages.
#' 
#' @details 
#' The core functions/methods of this package: 
#'  \itemize{
#'    \item{\code{\link[descriptionr]{getPackageDescription}}: }{
#'    
#'        Supports reading content of a package's \code{DESCRIPTION} file
#'        regardless if the input corresponds to the directory path of a 
#'        package project (see package 
#'        \code{\href{http://cran.r-project.org/web/packages/devtools/index.html}{devtools}}) 
#'        or to the name of a loaded package.
#'    }
#'    \item{\code{\link[descriptionr]{getPackageName}}: }{
#'    
#'        Simplifies the retrieval of the package name as specified in
#'        a package's \code{DESCRIPTION} file regardless if it's a loaded 
#'        package project or a loaded package.
#'    }
#'    \item{\code{\link[descriptionr]{getPackageVersion}}: }{
#'    
#'        Simplifies the retrieval of the package version as specified in
#'        a package's \code{DESCRIPTION} file regardless if it's a loaded 
#'        package project or a loaded package.
#'    }
#'    \item{\code{\link[descriptionr]{getPackageDependencies}}: }{
#'    
#'        Simplifies the retrieval of the different types of package dependencies 
#'        (global dependencies, imported dependencies, suggested dependencies)
#'        as specified in a package's \code{DESCRIPTION} file regardless if 
#'        it's a loaded package project or a loaded package.
#'    }
#'  }
#' @template author
#' @template references
#' @docType package
#' @name descriptionr
NULL
