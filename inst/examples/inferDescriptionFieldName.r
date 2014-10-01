\dontrun{

from <- R.home("library/base/DESCRIPTION")
desc <- getPackageDescription(from = from)
desc

inferDescriptionFieldName(from = from, pattern = "Vers")
inferDescriptionFieldName(from = from, pattern = "Version")
inferDescriptionFieldName(from = from, pattern = "P")
inferDescriptionFieldName(from = from, pattern = "Nonexisting")
inferDescriptionFieldName(from = from)

}
