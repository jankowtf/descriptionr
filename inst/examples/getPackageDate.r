##------------------------------------------------------------------------------
## From package project DESCRIPTION file //
##------------------------------------------------------------------------------

## This expects the existence of a DESCRIPTION file in your current 
## working directory (else it will fail!):
getPackageDate()  

## Explicit specification of the DESCRIPTION file's location: 
getPackageDate(from = "DESCRIPTION")  

##------------------------------------------------------------------------------
## From package DESCRIPTION file //
##------------------------------------------------------------------------------

require("devtools")
getPackageDate(from = "devtools")  
## Note that the field name has been inferred as 'devtools' does not use 
## the field 'Date' but 'Date/Publication'

## Error handling //
getPackageDate(from = tempdir()) 
expect_equal(res, NA)  
    

