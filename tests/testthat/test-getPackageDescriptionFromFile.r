context("getPackageDescriptionFromFile-1")

test_that("getPackageDescriptionFromFile", {

  is_testthat <- FALSE
  if (basename(getwd()) == "testthat") {
    is_testthat <- TRUE
  }
  
  expected_0 <- "packageDescription"
  expected <- expected_0
  expect_is(res <- getPackageDescriptionFromFile(), expected)  
  
  from <- "DESCRIPTION"
  expect_is(res <- getPackageDescriptionFromFile(from = from), expected)  
  
  fields <- "Version"
  expected <- "character"
  expect_is(res <- getPackageDescriptionFromFile(fields = fields), expected)  
  if (!is_testthat) {
    expect_true(length(res) > 0)  
  } else {
    expect_equal(res, "0.1.0.1")  
  }
  expect_is(res <- getPackageDescriptionFromFile(from = from, 
      fields = fields), 
    expected)  
  expect_is(res <- getPackageDescriptionFromFile(fields = fields, 
      drop = FALSE), 
    expected_0)  
  
  ## Condition handling //
  expect_warning(res <- getPackageDescriptionFromFile(from = tempdir()))  
  expect_equal(res, NA)  
  expect_error(res <- getPackageDescriptionFromFile(from = tempdir(), strict = TRUE))  
  
  }
)

