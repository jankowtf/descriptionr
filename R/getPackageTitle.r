#' @title
#' Get Package Title
#'
#' @description 
#' Get package title.
#' 
#' @param from \strong{Signature argument}.
#'    Object containing source information.
#' @param ... Further arguments passed to subsequent functions/methods.
#'    In particular:
#'    \code{\link[rapp.core.description]{getPackageDescription}}.
#' @example inst/examples/getPackageTitle.r
#' @seealso \code{
#'    \link[rapp.core.description]{getPackageTitle-character-method}
#' }
#' @template author
#' @template references
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

#' @title
#' Get Package Title
#'
#' @description 
#' See generic: \code{\link[rapp.core.description]{getPackageTitle}}
#' 
#' @inheritParams getPackageTitle
#' @param from \code{\link{character}}.
#' @return \code{\link{character}}. Package title. 
#' @example inst/examples/getPackageTitle.r
#' @seealso \code{
#'    \link[rapp.core.description]{getPackageTitle}
#' }
#' @template author
#' @template references
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

#' @title
#' Get Package Title
#'
#' @description 
#' See generic: \code{\link[rapp.core.description]{getPackageTitle}}
#' 
#' @inheritParams getPackageTitle
#' @param from \code{\link{missing}}.  
#' @return See 
#'    \code{\link[rapp.core.description]{getPackageTitle-character-method}}.
#' @example inst/examples/getPackageTitle.r
#' @seealso \code{
#'    \link[rapp.core.description]{getPackageTitle},
#'    \link[rapp.core.description]{getPackageTitle-character-method}
#' }
#' @template author
#' @template references
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

