context("package")

test_that("getPackageImportedDependencies", {

  is_testthat <- FALSE
  if (basename(getwd()) == "testthat") {
    is_testthat <- TRUE
  }
  
  ## From project DESCRIPTION file //
  expected <- "character"
  expect_is(res <- getPackageImportedDependencies(), expected)  
  from <- "DESCRIPTION"
  expect_is(res <- getPackageImportedDependencies(from = from), expected)  
  
  expect_is(res <- getPackageImportedDependencies(type = "names_only"), expected)
  expected <- "data.frame"
  expect_is(res <- getPackageImportedDependencies(type = "detailed"), expected)
  
  if (!is_testthat) {
    expect_true(length(res) > 0)  
  } else {
    expect_equal(res, data.frame(
      name = "rapp.core.library", 
      version = NA, 
      restriction = NA, 
      stringsAsFactors = FALSE)
    )  
  }
  
  ## From package DESCRIPTION file //
  from <- "devtools"
  expected <- "character"
  expect_is(res <- getPackageImportedDependencies(from = from), expected)  
  expect_is(res <- getPackageImportedDependencies(from = from, 
    type = "names_only"), expected)
  expected <- "data.frame"
  expect_is(res <- getPackageImportedDependencies(from = from, 
    type = "detailed"), expected)
  
  ## Error handling //
  expect_warning(res <- getPackageImportedDependencies(from = tempdir()))  
  expect_equal(res, NA)  
  
  }
)

