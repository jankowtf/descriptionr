#' Get Package Version
#'
#' @description 
#' Get package version.
#' 
#' @param from \strong{Signature argument}.
#'    Object containing source information.
#' @param ... Further arguments passed to subsequente functions:
#'    \code{\link[rapp.core.description]{getPackageDescription}}.
#' @author Janko Thyson \email{janko.thyson@@rappster.de}
#' @references \url{http://www.rappster.de/rapp.core.description}
#' @example inst/examples/getPackageVersion.R
#' @export getPackageVersion
setGeneric(name="getPackageVersion", 
  signature = c(
    "from"
  ),
  def = function(
    from = ".",
    ...
  ) {
  standardGeneric("getPackageVersion")
})

#' @param from \code{\link{character}}.
#' @return \code{character}. 
#' @describeIn getPackageVersion
#' @export
setMethod(f = "getPackageVersion", 
  signature = signature(
      from = "character"
  ), 
  definition = function(
      from,
      ...
  ) {
  
  getPackageDescription(from = from, fields = "Version", drop = TRUE, ...)
  
  } 
)

#' @param from \code{\link{missing}}.  
#' @return See signature \code{character}.
#' @describeIn getPackageVersion
#' @export
setMethod(f = "getPackageVersion", 
  signature = signature(
    from = "missing"
  ), 
  definition = function(
    from,
    ...
  ) {
  
  getPackageVersion(from = from, ...)
  
  } 
)

