context("inferDescriptionFieldName-A")

test_that("inferDescriptionFieldName", {

  is_testthat <- FALSE
  if (basename(getwd()) == "testthat") {
    is_testthat <- TRUE
  }
  
  ## From project DESCRIPTION file //
  expected <- character()
  expect_equal(res <- inferDescriptionFieldName(), expected)  
  expected <- "Date"
  expect_equal(res <- inferDescriptionFieldName(pattern = "Date"), expected)  
  
  from <- "DESCRIPTION"
  expected <- character()
  expect_equal(res <- inferDescriptionFieldName(from = from), expected)  
  
  expected <- character()
  expect_equal(res <- inferDescriptionFieldName(pattern = "nonexisting"), expected)  
  
  }
)

