context("package")

test_that("getPackageDependentDependencies", {

  is_testthat <- FALSE
  if (basename(getwd()) == "testthat") {
    is_testthat <- TRUE
  }
  
  ## From project DESCRIPTION file //
  expected <- "logical"
  expect_is(res <- getPackageDependentDependencies(), expected)  
  from <- "DESCRIPTION"
  expect_is(res <- getPackageDependentDependencies(from = from), expected)  
  
  expect_is(res <- getPackageDependentDependencies(type = "names_only"), expected)
  expected <- "logical"
  expect_is(res <- getPackageDependentDependencies(type = "detailed"), expected)
  
  if (!is_testthat) {
    expect_true(length(res) > 0)  
  } else {
    expect_equal(res, NA)  
  }
  
  ## From package DESCRIPTION file //
  from <- "devtools"
  expected <- "character"
  expect_is(res <- getPackageDependentDependencies(from = from), expected)  
  expect_is(res <- getPackageDependentDependencies(from = from, 
    type = "names_only"), expected)
  expected <- "data.frame"
  expect_is(res <- getPackageDependentDependencies(from = from, 
    type = "detailed"), expected)
  
  ## Error handling //
  expect_warning(res <- getPackageDependentDependencies(from = tempdir()))  
  expect_equal(res, NA)  
  
  }
)

