context("getPackageName-1")

test_that("getPackageName", {

  is_testthat <- FALSE
  if (basename(getwd()) == "testthat") {
    is_testthat <- TRUE
  }
  
  ## From project DESCRIPTION file //
  expected <- "rapp.core.description"
  expect_equal(res <- getPackageName(), expected)  
  
  from <- "DESCRIPTION"
  expect_equal(res <- getPackageName(from = from), expected)  
  
  if (!is_testthat) {
    expect_true(length(res) > 0)  
  } else {
    expect_equal(res, expected)  
  }
  
  ## From package DESCRIPTION file //
  from <- "devtools"
  expect_equal(res <- getPackageName(from = from), from)  
  
  ## Error handling //
  expect_warning(res <- getPackageName(from = tempdir()))  
  expect_equal(res, NA)  
  
  }
)

