#' Get Package Description From File
#'
#' @description 
#' Get package description from \code{DESCRIPTION} file.
#' 
#' @param from \strong{Signature argument}.
#'    Object containing file path information.
#' @param fields \code{Signature argument}.
#'    Object containing field name information.
#' @param drop \code{logical}.
#'    If \code{TRUE} and the length of \code{fields} is 1, then a single 
#'    character string with the value of the respective field is returned 
#'    instead of an object of class \code{packageDescription}.
#' @param encoding \code{character}.
#'    If there is an Encoding field, to what encoding should re-encoding be 
#'    attempted? If NA, no re-encoding. The other values are as used by 
#'    \code{\link{iconv}}, so the default \code{""} indicates the encoding of 
#'    the current locale.
#' @param strict \code{logical}.
#'    \code{TRUE}: certain constellations trigger an error. \code{FALSE} (default): these 
#'    conditions are only reflected by a return value of \code{NA} and 
#'    possibly a corresponding warning. 
#' @param validate \code{logical}.
#'    Perform validation checks (\code{TRUE}, default) or not (\code{FALSE}).
#' @author Janko Thyson \email{janko.thyson@@rappster.de}
#' @references \url{http://www.rappster.de/rapp.core.repos}
#' @example inst/examples/getPackageDescriptionFromFile.R
#' @export getPackageDescriptionFromFile
setGeneric(name="getPackageDescriptionFromFile", 
  signature = c(
    "from",
    "fields"
  ),
  def = function(
    from = "DESCRIPTION",
    fields = character(),
    drop = TRUE,
    encoding = "",
    strict = FALSE,
    validate = TRUE
  ) {
  standardGeneric("getPackageDescriptionFromFile")
})

#' @param from \code{\link{character}}.  
#' @param fields \code{\link{character}}.  
#     A vector giving the tags of fields to return (if other fields occur in 
#     the file they are ignored).
#' @return \code{character}. 
#' @describeIn getPackageDescriptionFromFile
#' @export
setMethod(f = "getPackageDescriptionFromFile", 
  signature = signature(
    from = "character",
    fields = "character"
  ), 
  definition = function(
    from,
    fields,
    drop,
    encoding,
    strict,
    validate
  ) {
    
  from_0 <- from
  
  if (validate) {
    is_dir <- file.info(from)$isdir
    if (is.na(is_dir) || is_dir) {
      rapp.core.condition::signalCondition(
        condition = "InvalidArgumentValue",
        msg = c(
          "Invalid argument value for 'from'",
          Details = "expecting file path of DESCRIPTION file",
          Value = from
        ),
        ns = "rapp.core.description",
        type = ifelse(strict, "error", "warning")
      )
      return(NA)
    }
  }
    
  out <- list()
  if (length(fields)) {
      fields <- as.character(fields)
      out[fields] <- NA
  }
  
  if (file.exists(from)) {
    desc <- readLines(from)
    if (!length(desc)) {
      rapp.core.condition::signalCondition(
        condition = "InvalidDescriptionContent",
        msg = c(
          "Invalid DESCRIPTION content",
          Details = "emtpy file",
          Path = from
        ),
        ns = "rapp.core.description",
        type = "error"
      )
    }
    
#     ## Names extraction //
#     ## NOTE: using 'read.dcf' is much better!
#     tmp <- strsplit(desc, split = ":\\s*")
#     desc <- sapply(tmp, "[[", 2)
#     names(desc) <- sapply(tmp, "[[", 1)
    
    dcf <- read.dcf(file = from)
    desc <- as.list(dcf[1, ])
  } else {
    from <- ""
  }
  
  if (from != "") {
    enc <- desc[["Encoding"]]
    if (!is.null(enc) && !is.na(encoding)) {
      if (missing(encoding) && Sys.getlocale("LC_CTYPE") == 
            "C") 
        encoding <- "ASCII//TRANSLIT"
      newdesc <- try(lapply(desc, iconv, from = enc, to = encoding))
      if (!inherits(newdesc, "try-error")) 
        desc <- newdesc
      else warning("'DESCRIPTION' file has an 'Encoding' field and re-encoding is not possible", 
                   call. = FALSE)
    }
    if (length(fields)) {
      ok <- names(desc) %in% fields
      out[names(desc)[ok]] <- desc[ok]
    } else {
      out[names(desc)] <- desc
    }
  }
  
  if ((from == "") || (length(out) == 0)) {
    rapp.core.condition::signalCondition(
      condition = "InvalidPathToDescriptionFile",
      msg = c(
        "Invalid path to DESCRIPTION file",
        Path = from_0
      ),
      ns = "rapp.core.description",
      type = ifelse(strict, "error", "warning")
    )
    return(NA)
  }
  
  if (drop & length(fields) == 1L) {
    return(out[[1L]])
  }
  class(out) <- "packageDescription"
  if (length(fields)) {
    attr(out, "fields") <- fields
  }
  attr(out, "file") <- from
  out
  
  } 
)

#' @param from \code{\link{missing}}.  
#' @param fields \code{\link{character}}.  
#     See signature \code{character,character}
#' @return See signature \code{character,character}.
#' @describeIn getPackageDescriptionFromFile
#' @export
setMethod(f = "getPackageDescriptionFromFile", 
  signature = signature(
    from = "missing",
    fields = "character"
  ), 
  definition = function(
    from,
    fields,
    drop,
    encoding,
    strict,
    validate
  ) {
  
  getPackageDescriptionFromFile(
    from = from,
    fields = fields,
    drop = drop,
    encoding = encoding,
    strict = strict,
    validate = validate
  )
  
  } 
)

#' @param from \code{\link{missing}}.  
#' @param fields \code{\link{missing}}.  
#' @return See signature \code{character,character}.
#' @describeIn getPackageDescriptionFromFile
#' @export
setMethod(f = "getPackageDescriptionFromFile", 
  signature = signature(
    from = "missing",
    fields = "missing"
  ), 
  definition = function(
    from,
    fields,
    drop,
    encoding,
    strict,
    validate
  ) {
  
  getPackageDescriptionFromFile(
    from = from,
    fields = fields,
    drop = drop,
    encoding = encoding,
    strict = strict,
    validate = validate
  )
  
  } 
)

#' @param from \code{\link{character}}.  
#     See signature \code{character,character}
#' @param fields \code{\link{missing}}.  
#' @return See signature \code{character,character}.
#' @describeIn getPackageDescriptionFromFile
#' @export
setMethod(f = "getPackageDescriptionFromFile", 
  signature = signature(
    from = "character",
    fields = "missing"
  ), 
  definition = function(
    from,
    fields,
    drop,
    encoding,
    strict,
    validate
  ) {
  
  getPackageDescriptionFromFile(
    from = from,
    fields = fields,
    drop = drop,
    encoding = encoding,
    strict = strict,
    validate = validate
  )
  
  } 
)


