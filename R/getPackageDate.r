#' Get Package Date
#'
#' @description 
#' Get package date.
#' 
#' @param from \strong{Signature argument}.
#'    Object containing source information.
#' @param ... Further arguments passed to subsequente functions:
#'    \code{\link[rapp.core.description]{getPackageDescription}}.
#' @author Janko Thyson \email{janko.thyson@@rappster.de}
#' @references \url{http://www.rappster.de/rapp.core.description}
#' @example inst/examples/getPackageDate.R
#' @export getPackageDate
setGeneric(name="getPackageDate", 
  signature = c(
    "from"
  ),
  def = function(
    from = ".",
    ...
  ) {
  standardGeneric("getPackageDate")
})

#' @param from \code{\link{character}}.
#' @return \code{character}. 
#' @describeIn getPackageDate
#' @export
setMethod(f = "getPackageDate", 
  signature = signature(
      from = "character"
  ), 
  definition = function(
      from,
      ...
  ) {
  
  getPackageDescription(from = from, fields = "Date", drop = TRUE, ...)
  
  } 
)

#' @param from \code{\link{missing}}.  
#' @return See signature \code{character}.
#' @describeIn getPackageDate
#' @export
setMethod(f = "getPackageDate", 
  signature = signature(
    from = "missing"
  ), 
  definition = function(
    from,
    ...
  ) {
  
  getPackageDate(from = from, ...)
  
  } 
)

