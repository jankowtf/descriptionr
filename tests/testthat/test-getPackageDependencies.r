context("getPackageDependencies-A")
test_that("getPackageDependencies", {

  is_testthat <- FALSE
  if (basename(getwd()) == "testthat") {
    is_testthat <- TRUE
  }
  
  ## From project DESCRIPTION file //
  expected <- "character"
  expect_is(res <- getPackageDependencies(), expected)  
  from <- "DESCRIPTION"
  expect_is(res <- getPackageDependencies(from = from), expected)  
  
  expect_is(res <- getPackageDependencies(type = "names_only"), expected)
  expected <- "data.frame"
  expect_is(res <- getPackageDependencies(type = "detailed"), expected)
  
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
  expect_is(res <- getPackageDependencies(from = from), expected)  
  expect_is(res <- getPackageDependencies(from = from, 
    type = "names_only"), expected)
  expected <- "data.frame"
  expect_is(res <- getPackageDependencies(from = from, 
    type = "detailed"), expected)
  
  ## Error handling //
  expect_warning(res <- getPackageDependencies(from = tempdir()))  
  expect_equal(res, NA)  
  
  expected <- "character"
  expect_is(res <- getPackageDependencies(dep_type = "imported"), expected)  
  expect_is(res <- getPackageDependencies(
    dep_type = "imported", type = "names_only"), expected)  
  expect_is(res <- getPackageDependencies(dep_type = "global"), "logical")  
  expect_equal(res <- getPackageDependencies(
    dep_type = "global", type = "names_only"), NA)  
  expect_equal(res <- getPackageDependencies(
    dep_type = "global", type = "detailed"), NA)  
  expect_is(res <- getPackageDependencies(dep_type = "suggested"), "logical")  
  expect_equal(res <- getPackageDependencies(
    dep_type = "suggested", type = "names_only"), NA)  
  expect_equal(res <- getPackageDependencies(
    dep_type = "suggested", type = "detailed"), NA)  
  
  }
)

