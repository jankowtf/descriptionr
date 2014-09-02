context("package")

test_that("getPackageDescription", {

  is_testthat <- FALSE
  if (basename(getwd()) == "testthat") {
    is_testthat <- TRUE
  }
  
  ## From project DESCRIPTION file //
  expected_0 <- "packageDescription"
  expected <- expected_0
  expect_is(res <- getPackageDescription(), expected)  
  
  from <- "DESCRIPTION"
  expect_is(res <- getPackageDescription(from = from), expected)  
  
  fields <- "Version"
  expected <- "character"
  expect_is(res <- getPackageDescription(fields = fields), expected)  
  if (!is_testthat) {
    expect_true(length(res) > 0)  
  } else {
    expect_equal(res, "0.1.0.1")  
  }
  expect_is(res <- getPackageDescription(from = from, 
      fields = fields), 
    expected)  
  expect_is(res <- getPackageDescription(fields = fields, 
      drop = FALSE), 
    expected_0)  
  
  ## From package DESCRIPTION file //
  expected_0 <- "packageDescription"
  expected <- expected_0
  expect_is(res <- getPackageDescription(), expected)  
  
  from <- "devtools"
  expect_is(res <- getPackageDescription(from = from), expected)  
  
  fields <- "Version"
  expected <- "character"
  expect_is(res <- getPackageDescription(fields = fields), expected)  
  if (!is_testthat) {
    expect_true(length(res) > 0)  
  } else {
    expect_equal(res, "0.1.0.1")  
  }
  expect_is(res <- getPackageDescription(from = from, 
      fields = fields), 
    expected)  
  expect_is(res <- getPackageDescription(fields = fields, 
      drop = FALSE), 
    expected_0)  
  
  ## Condition handling //
  expect_warning(res <- getPackageDescription(from = tempdir()))  
  expect_equal(res, NA)  
  expect_error(res <- getPackageDescription(from = tempdir(), strict = TRUE))  
  
  }
)

