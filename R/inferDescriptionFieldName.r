#' @title
#' Infer Description Field Name
#'
#' @description 
#' Infers a description field name based on \code{\link[base]{grep}}.
#' 
#' @param from \strong{Signature argument}.
#'    Object containing source information.
#' @param pattern \code{\link{character}}.
#'    Pattern based on which to infer the actual field name.
#' @param ... Further arguments passed to subsequent functions/methods.
#'    In particular:
#'    \code{\link[descriptionr]{getPackageDescription}}.
#' @example inst/examples/inferDescriptionFieldName.r
#' @seealso \code{
#'    \link[descriptionr]{getPackageDescriptionFromFile-character-method}
#' }
#' @template author
#' @template references
#' @export inferDescriptionFieldName
setGeneric(name="inferDescriptionFieldName", 
  signature = c(
    "from"
  ),
  def = function(
    from = ".",
    pattern = character(),
    ...
  ) {
  standardGeneric("inferDescriptionFieldName")
})

#' @title
#' Get Package Name
#' 
#' @description 
#' See generic: \code{\link[descriptionr]{inferDescriptionFieldName}}
#' 
#' @inheritParams inferDescriptionFieldName
#' @param from \code{\link{missing}}.  
#' @return See 
#'    \code{\link[descriptionr]{inferDescriptionFieldName-packageDescription-method}}.
#' @example inst/examples/inferDescriptionFieldName.r
#' @seealso \code{
#'    \link[descriptionr]{inferDescriptionFieldName},
#'    \link[descriptionr]{inferDescriptionFieldName-character-method}
#' }
#' @template author
#' @template references
#' @export
setMethod(f = "inferDescriptionFieldName", 
  signature = signature(
    from = "missing"
  ), 
  definition = function(
    from,
    ...
  ) {
  
  return(inferDescriptionFieldName(from = from, pattern = pattern, ...))
  
  } 
)

#' @title
#' Infer Description Field Name
#' 
#' @description 
#' See generic: \code{\link[descriptionr]{inferDescriptionFieldName}}
#' 
#' @inheritParams inferDescriptionFieldName
#' @param from \code{\link{character}}.
#' @return See method
#'    \code{\link[descriptionr]{inferDescriptionFieldName-packageDescription-method}}.
#' @example inst/examples/inferDescriptionFieldName.r
#' @seealso \code{
#'    \link[descriptionr]{inferDescriptionFieldName}
#' }
#' @template author
#' @template references
#' @export
setMethod(f = "inferDescriptionFieldName", 
  signature = signature(
      from = "character"
  ), 
  definition = function(
      from,
      pattern,
      ...
  ) {
  
  return(inferDescriptionFieldName(
    from = getPackageDescription(from = from, ...),
    pattern = pattern,
    ...
  ))
  
  } 
)

#' @title
#' Infer Description Field Name
#' 
#' @description 
#' See generic: \code{\link[descriptionr]{inferDescriptionFieldName}}
#' 
#' @inheritParams inferDescriptionFieldName
#' @param from \code{\link{packageDescription}}.
#' @return \code{character}. Inferred field name(s).
#' @example inst/examples/inferDescriptionFieldName.r
#' @seealso \code{
#'    \link[descriptionr]{inferDescriptionFieldName}
#' }
#' @template author
#' @template references
#' @export
setMethod(f = "inferDescriptionFieldName", 
  signature = signature(
      from = "packageDescription"
  ), 
  definition = function(
      from,
      pattern,
      ...
  ) {
  
  if (length(pattern)) {
    idx <- lapply(pattern, grep, names(from))
    out <- unlist(lapply(idx, function(ii) {
        names(from)[ii]
    }))
  } else {
    out <- character()
  }
  
  return(out)
  
  } 
)



