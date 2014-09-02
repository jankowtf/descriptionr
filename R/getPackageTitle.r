#' Get Package Title
#'
#' @description 
#' Get package title.
#' 
#' @param from \strong{Signature argument}.
#'    Object containing source information.
#' @param ... Further arguments passed to subsequente functions:
#'    \code{\link[rapp.core.description]{getPackageDescription}}.
#' @author Janko Thyson \email{janko.thyson@@rappster.de}
#' @references \url{http://www.rappster.de/rapp.core.description}
#' @example inst/examples/getPackageTitle.R
#' @export getPackageTitle
setGeneric(name="getPackageTitle", 
  signature = c(
    "from"
  ),
  def = function(
    from = ".",
    ...
  ) {
  standardGeneric("getPackageTitle")
})

#' @param from \code{\link{character}}.
#' @return \code{character}. 
#' @describeIn getPackageTitle
#' @export
setMethod(f = "getPackageTitle", 
  signature = signature(
      from = "character"
  ), 
  definition = function(
      from,
      ...
  ) {
  
  getPackageDescription(from = from, fields = "Title", drop = TRUE, ...)
  
  } 
)

#' @param from \code{\link{missing}}.  
#' @return See signature \code{character}.
#' @describeIn getPackageTitle
#' @export
setMethod(f = "getPackageTitle", 
  signature = signature(
    from = "missing"
  ), 
  definition = function(
    from,
    ...
  ) {
  
  getPackageTitle(from = from, ...)
  
  } 
)

