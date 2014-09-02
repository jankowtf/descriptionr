context("package")

test_that("getPackageDate", {

  is_testthat <- FALSE
  if (basename(getwd()) == "testthat") {
    is_testthat <- TRUE
  }
  
  ## From project DESCRIPTION file //
  expected <- "character"
  expect_is(res <- getPackageDate(), expected)  
  
  from <- "DESCRIPTION"
  expect_is(res <- getPackageDate(from = from), expected)  
  
  if (!is_testthat) {
    expect_true(length(res) > 0)  
  } else {
    expect_equal(res, "2014-08-05")  
  }
  
  ## From package DESCRIPTION file //
  from <- "devtools"
  expect_warning(
    expect_is(res <- getPackageDate(from = from), expected)  
  )
  
  ## Condition handling //
  expect_warning(res <- getPackageDate(from = tempdir()))  
  expect_equal(res, NA) 
  expect_error(res <- getPackageDate(from = tempdir(), strict = TRUE))  
  
  }
)

