#' @title
#' Get Package Date
#'
#' @description 
#' Retrieves package date.
#' 
#' @param from \strong{Signature argument}.
#'    Object containing source information.
#' @param ... Further arguments passed to subsequent functions/methods.
#'    In particular: 
#'    \code{\link[descriptionr]{getPackageDate}}.
#' @example inst/examples/getPackageDate.r
#' @seealso \code{
#'    \link[descriptionr]{getPackageDate-character-method}
#' }
#' @template author
#' @template references
#' @export 
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

#' @title
#' Get Package Date
#'
#' @description 
#' See generic: \code{\link[descriptionr]{getPackageDate}}
#' 
#' @inheritParams getPackageDate
#' @param from \code{\link{missing}}.  
#' @return See method 
#'    \code{\link[descriptionr]{getPackageDate-character-method}}.
#' @example inst/examples/getPackageDate.r
#' @seealso \code{
#'    \link[descriptionr]{getPackageDate}
#'    \link[descriptionr]{getPackageDate-character-method}
#' }
#' @template author
#' @template references
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

#' @title
#' Get Package Date
#'
#' @description 
#' See generic: \code{\link[descriptionr]{getPackageDate}}
#' 
#' @inheritParams getPackageDate
#' @param from \code{\link{character}}.
#' @return Depends on argument \code{type}. Either \code{\link{character}} vector
#'    or \code{\link{data.frame}}.
#' @example inst/examples/getPackageDate.r
#' @seealso \code{
#'    \link[descriptionr]{getPackageDate}
#' }
#' @template author
#' @template references
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



