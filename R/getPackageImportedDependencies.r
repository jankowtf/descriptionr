#' Get Package Imported Dependencies
#'
#' @description 
#' Get package dependencies as stated via the \code{Imports} section.
#' 
#' @param from \strong{Signature argument}.
#'    Object containing source information.
#' @param type \code{character}.
#'    Either one of \code{c("as_is", "names_only", "detailed")}.
#' @param ... Further arguments passed to subsequente functions:
#'    \code{\link[rapp.core.description]{getPackageDescription}}.
#' @author Janko Thyson \email{janko.thyson@@rappster.de}
#' @references \url{http://www.rappster.de/rapp.core.description}
#' @example inst/examples/getPackageImportedDependencies.R
#' @export getPackageImportedDependencies
setGeneric(name="getPackageImportedDependencies", 
  signature = c(
    "from"
  ),
  def = function(
    from = ".",
    type = c("as_is", "names_only", "detailed"),
    ...
  ) {
  standardGeneric("getPackageImportedDependencies")
})

#' @param from \code{\link{character}}.
#' @return \code{character}. 
#' @describeIn getPackageImportedDependencies
#' @export
setMethod(f = "getPackageImportedDependencies", 
  signature = signature(
    from = "character"
  ), 
  definition = function(
    from,
    type,
    ...
  ) {
  
  type <- match.arg(type, choices = c("as_is", "names_only", "detailed"))    
  tmp <- getPackageDescription(from = from, fields = "Imports", drop = TRUE, ...)
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
    rapp.core.condition::signalCondition(
      condition = "InvalidArgumentValue",
      msg = c(
        "Invalid argument value for 'type'",
        Valid = c("as_is", "names_only", "detailed")
      ),
      ns = "rapp.core.description",
      type = "error"
    )
  }
  out
  
  } 
)

#' @param from \code{\link{missing}}.  
#' @return See signature \code{character}.
#' @describeIn getPackageImportedDependencies
#' @export
setMethod(f = "getPackageImportedDependencies", 
  signature = signature(
    from = "missing"
  ), 
  definition = function(
    from,
    type,
    ...
  ) {
  
  getPackageImportedDependencies(from = from, type = type, ...)
  
  } 
)

