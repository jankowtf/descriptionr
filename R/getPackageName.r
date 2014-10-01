#' @title
#' Get Package Name
#'
#' @description 
#' Get package name.
#' 
#' @param from \strong{Signature argument}.
#'    Object containing source information.
#' @param ... Further arguments passed to subsequent functions/methods.
#'    In particular:
#'    \code{\link[descriptionr]{getPackageDescription}}.
#' @example inst/examples/getPackageName.r
#' @seealso \code{
#'    \link[descriptionr]{getPackageDescriptionFromFile-character-method}
#' }
#' @template author
#' @template references
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

#' @title
#' Get Package Name
#' 
#' @description 
#' See generic: \code{\link[descriptionr]{getPackageName}}
#' 
#' @inheritParams getPackageName
#' @param from \code{\link{character}}.
#' @return \code{character}. Package name.
#' @example inst/examples/getPackageName.r
#' @seealso \code{
#'    \link[descriptionr]{getPackageName}
#' }
#' @template author
#' @template references
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

#' @title
#' Get Package Name
#' 
#' @description 
#' See generic: \code{\link[descriptionr]{getPackageName}}
#' 
#' @inheritParams getPackageName
#' @param from \code{\link{missing}}.  
#' @return See 
#'    \code{\link[descriptionr]{getPackageName-character-method}}.
#' @example inst/examples/getPackageName.r
#' @seealso \code{
#'    \link[descriptionr]{getPackageName},
#'    \link[descriptionr]{getPackageName-character-method}
#' }
#' @template author
#' @template references
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

