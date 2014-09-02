context("package")

test_that("getPackageTitle", {

  is_testthat <- FALSE
  if (basename(getwd()) == "testthat") {
    is_testthat <- TRUE
  }
  
  ## From project DESCRIPTION file //
  expected <- "character"
  expect_is(res <- getPackageTitle(), expected)  
  
  from <- "DESCRIPTION"
  expect_is(res <- getPackageTitle(from = from), expected)  
  
  if (!is_testthat) {
    expect_true(length(res) > 0)  
  } else {
    expect_equal(res, "What the package does (short line)")  
  }
  
  ## From package DESCRIPTION file //
  from <- "devtools"
  expect_is(res <- getPackageTitle(from = from), expected)  
  
  ## Error handling //
  expect_warning(res <- getPackageTitle(from = tempdir()))  
  expect_equal(res, NA)  
  
  }
)

