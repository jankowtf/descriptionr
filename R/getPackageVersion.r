#' @title
#' Get Package Version
#'
#' @description 
#' Get package version.
#' 
#' @param from \strong{Signature argument}.
#'    Object containing source information.
#' @param ... Further arguments passed to subsequente functions:
#'    \code{\link[descriptionr]{getPackageDescription}}.
#' @example inst/examples/getPackageVersion.r
#' @seealso \code{
#'    \link[descriptionr]{getPackageVersion-character-method}
#' }
#' @template author
#' @template references
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

#' @title
#' Get Package Version
#' 
#' @description 
#' See generic: \code{\link[descriptionr]{getPackageVersion}}
#' 
#' @inheritParams getPackageVersion
#' @param from \code{\link{character}}.
#' @return \code{\link{character}}. Package version. 
#' @example inst/examples/getPackageVersion.r
#' @seealso \code{
#'    \link[descriptionr]{getPackageVersion}
#' }
#' @template author
#' @template references
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

#' @title
#' Get Package Version
#' 
#' @description 
#' See generic: \code{\link[descriptionr]{getPackageVersion}}
#' 
#' @inheritParams getPackageVersion
#' @param from \code{\link{missing}}.  
#' @return See 
#'    \code{\link[descriptionr]{getPackageVersion-character-method}}.
#' @example inst/examples/getPackageVersion.r
#' @seealso \code{
#'    \link[descriptionr]{getPackageVersion},
#'    \link[descriptionr]{getPackageVersion-character-method}
#' }
#' @template author
#' @template references
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

