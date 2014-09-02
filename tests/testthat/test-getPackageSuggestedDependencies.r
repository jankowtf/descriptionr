context("package")

test_that("getPackageSuggestedDependencies", {

  is_testthat <- FALSE
  if (basename(getwd()) == "testthat") {
    is_testthat <- TRUE
  }
  
  ## From project DESCRIPTION file //
  expected <- "logical"
  expect_is(res <- getPackageSuggestedDependencies(), expected)  
  from <- "DESCRIPTION"
  expect_is(res <- getPackageSuggestedDependencies(from = from), expected)  
  
  expect_is(res <- getPackageSuggestedDependencies(type = "names_only"), expected)
  expected <- "logical"
  expect_is(res <- getPackageSuggestedDependencies(type = "detailed"), expected)
  
  if (!is_testthat) {
    expect_true(length(res) > 0)  
  } else {
    expect_equal(res, NA)  
  }
  
  ## From package DESCRIPTION file //
  from <- "devtools"
  expected <- "character"
  expect_is(res <- getPackageSuggestedDependencies(from = from), expected)  
  expect_is(res <- getPackageSuggestedDependencies(from = from, 
    type = "names_only"), expected)
  expected <- "data.frame"
  expect_is(res <- getPackageSuggestedDependencies(from = from, 
    type = "detailed"), expected)
  
  ## Error handling //
  expect_warning(res <- getPackageSuggestedDependencies(from = tempdir()))  
  expect_equal(res, NA)  
  
  }
)

