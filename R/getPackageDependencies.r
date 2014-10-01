#' Get Package Imported Dependencies
#'
#' @description 
#' Retrieves package dependencies as specified in the \code{DESCRIPTION}
#' file.
#' 
#' @param from \strong{Signature argument}.
#'    Object containing source information.
#' @param type \code{character}.
#'    Either one of \code{c("as_is", "names_only", "detailed")}.
#' @param dep_type \code{character}.
#'    Either one of \code{c("imported", "global", "suggested")}.
#'    This controls which type of dependencies should be retrieved
#' @param ... Further arguments passed to subsequente functions/methods.
#'    In particular:
#'    \code{\link[descriptionr]{getPackageDescription}}.
#' @example inst/examples/getPackageDependencies.r
#' @seealso \code{
#'    \link[descriptionr]{getPackageDependencies-character-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(name="getPackageDependencies", 
  signature = c(
    "from"
  ),
  def = function(
    from = ".",
    type = c("as_is", "names_only", "detailed"),
    dep_type = c("imported", "global", "suggested"),
    ...
  ) {
  standardGeneric("getPackageDependencies")
})

#' @title
#' Get Package Imported Dependencies
#'
#' @description 
#' See generic: \code{\link[descriptionr]{getPackageDependencies}}
#' 
#' @inheritParams getPackageDependencies
#' @param from \code{\link{character}}.
#' @return \code{character}. Package dependencies. 
#' @example inst/examples/getPackageDependencies.r
#' @seealso \code{
#'    \link[descriptionr]{getPackageDependencies}
#' }
#' @template author
#' @template references
#' @export
#' @import conditionr
setMethod(f = "getPackageDependencies", 
  signature = signature(
    from = "character"
  ), 
  definition = function(
    from,
    type,
    dep_type,
    ...
  ) {
  
  ## Validation //
  type <- match.arg(type, choices = c("as_is", "names_only", "detailed"))    
  dep_type <- match.arg(dep_type, choices = c("imported", "global", "suggested"))    
  
  field <- switch(
    dep_type,
    "imported" = "Imports",
    "global" = "Depends",
    "suggested" = "Suggests"
  )
  
  tmp <- getPackageDescription(from = from, fields = field, drop = TRUE, ...)
  if (is.na(tmp)) {
    return(tmp)
  }
  tmp <- unlist(strsplit(gsub("\\n", "", tmp), split = ", |,"))
  if (type == "as_is") {
    out <- tmp
  } else if (type == "names_only") {
    out <- gsub("(?<=\\w)(\\s|\\().*", "", tmp, perl = TRUE)  
  } else if (type == "detailed") {
    deps <- gsub("(?<=\\w)(\\s|\\().*", "", tmp, perl = TRUE)    
    vsns <- rep(NA, length(tmp))
    rest <- vsns
    idx  <- grep("\\(", tmp)
    if (length(idx)) {
      vsns[idx] <- gsub(".*(?=\\()", "", tmp[idx], perl = TRUE)  
      vsns <- gsub("\\(|>|<|=*|\\s*|\\)", "", vsns)
      rest[idx] <- gsub(".*(?=\\()", "", tmp[idx], perl = TRUE)  
      rest <- gsub("\\(|\\d*|\\.*|\\s*|\\)", "", rest)
    } 
    out <- data.frame(
      name = deps, 
      version = vsns, 
      restriction = rest,
      stringsAsFactors = FALSE
    )
  } else {
    conditionr::signalCondition(
      condition = "InvalidArgumentValue",
      msg = c(
        "Invalid argument value for 'type'",
        Valid = c("as_is", "names_only", "detailed")
      ),
      ns = "descriptionr",
      type = "error"
    )
  }
  out
  
  } 
)

#' @title
#' Get Package Imported Dependencies
#'
#' @description 
#' See generic: \code{\link[descriptionr]{getPackageDependencies}}
#' 
#' @inheritParams getPackageDependencies
#' @param from \code{\link{missing}}.
#' @return See method
#'    \code{\link[descriptionr]{getPackageDependencies-character-method}} 
#' @example inst/examples/getPackageDependencies.r
#' @seealso \code{
#'    \link[descriptionr]{getPackageDependencies},
#'    \link[descriptionr]{getPackageDependencies-character-method}
#' }
#' @template author
#' @template references
#' @export
setMethod(f = "getPackageDependencies", 
  signature = signature(
    from = "missing"
  ), 
  definition = function(
    from,
    type,
    dep_type,
    ...
  ) {
  
  getPackageDependencies(from = from, type = type, dep_type, ...)
  
  } 
)

