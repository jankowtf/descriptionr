\dontrun{

## For own package project //
getPackageDependencies()
from <- "DESCRIPTION"
getPackageDependencies(from = from)
getPackageDependencies(type = "names_only")
getPackageDependencies(type = "detailed")

## From package DESCRIPTION file //
from <- "devtools"
getPackageDependencies(from = from)
getPackageDependencies(from = from, type = "names_only")
getPackageDependencies(from = from, type = "detailed")

getPackageDependencies(from = from, dep_type = "global")
getPackageDependencies(from = from, dep_type = "suggested")

## Condition handling //
expect_warning(res <- getPackageDependencies(from = tempdir()))  
expect_equal(res, NA)  

}

