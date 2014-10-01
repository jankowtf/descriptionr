descriptionr (v0.1.3)
======

Processing of package DESCRIPTION files

## Installation

```
require("devtools")
devtools::install_github("Rappster/conditionr")
devtools::install_github("Rappster/descriptionr")
require("descriptionr")
```

## Quick intro

For a package project loaded via `devtools::load_all()` and assuming that
the current working directory corresponds to the package project's root directory:

```
getPackageDescription()
## Alternative way:
getPackageDescription(from = getwd())
getPackageDescription(from = file.path(getwd(), "DESCRIPTION"))
## --> this would actually call `getPackageDescriptionFromFile()`

getPackageDescription(fields = "Date")
getPackageDescription(fields = "Nonexisting")
```

For a *loaded* package:

```
require("devtools")
getPackageDescription(from = "devtools")
## Alternative way:
getPackageDescription(from = file.path(.libPaths()[1], "devtools"))
getPackageDescription(from = file.path(.libPaths()[1], "devtools/DESCRIPTION"))
## --> this would actually call `getPackageDescriptionFromFile()`

getPackageDescription(from = "devtools", fields = "Built")
```
