#' Get Package Name
#'
#' @description 
#' Get package name.
#' 
#' @param from \strong{Signature argument}.
#'    Object containing source information.
#' @param ... Further arguments passed to subsequente functions:
#'    \code{\link[rapp.core.description]{getPackageDescription}}.
#' @author Janko Thyson \email{janko.thyson@@rappster.de}
#' @references \url{http://www.rappster.de/rapp.core.description}
#' @example inst/examples/getPackageName.R
#' @export getPackageName
setGeneric(name="getPackageName", 
  signature = c(
    "from"
  ),
  def = function(
    from = ".",
    ...
  ) {
  standardGeneric("getPackageName")
})

#' @param from \code{\link{character}}.
#' @return \code{character}. 
#' @describeIn getPackageName
#' @export
setMethod(f = "getPackageName", 
  signature = signature(
      from = "character"
  ), 
  definition = function(
      from,
      ...
  ) {
  
  getPackageDescription(from = from, fields = "Package", drop = TRUE, ...)
  
  } 
)

#' @param from \code{\link{missing}}.  
#' @return See signature \code{character}.
#' @describeIn getPackageName
#' @export
setMethod(f = "getPackageName", 
  signature = signature(
    from = "missing"
  ), 
  definition = function(
    from,
    ...
  ) {
  
  getPackageName(from = from, ...)
  
  } 
)

