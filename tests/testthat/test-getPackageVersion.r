context("getPackageVersion-1")

test_that("getPackageVersion", {

  is_testthat <- FALSE
  if (basename(getwd()) == "testthat") {
    is_testthat <- TRUE
  }
  
  ## From project DESCRIPTION file //
  expected <- "character"
  expect_is(res <- getPackageVersion(), expected)  
  
  from <- "DESCRIPTION"
  expect_is(res <- getPackageVersion(from = from), expected)  
  
  if (!is_testthat) {
    expect_true(length(res) > 0)  
  } else {
    expect_equal(res, "0.1.0.1")  
  }
  
  ## From package DESCRIPTION file //
  from <- "devtools"
  expect_is(res <- getPackageVersion(from = from), expected)  
  
  ## Error handling //
  expect_warning(res <- getPackageName(from = tempdir()))  
  expect_equal(res, NA)  
  
  }
)

