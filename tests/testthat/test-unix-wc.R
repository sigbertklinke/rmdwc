test_that("anscombe", {
  file <- file.path(system.file("rmarkdown", 'anscombe.Rmd', package="rmdwc"))
  expect_true(file.exists(file))
  expect_equal(as.numeric(rmdcount(file, exclude='')[,2:5]), c(60, 186, 1634, 1626),
               tolerance=1)
})

test_that("banknote", {
  file <- file.path(system.file("rmarkdown", 'banknote.Rmd', package="rmdwc"))
  expect_true(file.exists(file))
  expect_equal(as.numeric(rmdcount(file, exclude='')[,2:5]), c(48, 155, 1356, 1356),
               tolerance=1)
})

test_that("bhd", {
  file <- file.path(system.file("rmarkdown", 'bhd.Rmd', package="rmdwc"))
  expect_true(file.exists(file))
  expect_equal(as.numeric(rmdcount(file, exclude='')[,2:5]), c(107, 748, 5229, 5227),
               tolerance=1)
})

test_that("concrete", {
  file <- file.path(system.file("rmarkdown", 'concrete.Rmd', package="rmdwc"))
  expect_true(file.exists(file))
  expect_equal(as.numeric(rmdcount(file, exclude='')[,2:5]), c(69, 375, 2915, 2915),
               tolerance=1)
})

test_that("cps7885", {
  file <- file.path(system.file("rmarkdown", 'cps7885.Rmd', package="rmdwc"))
  expect_true(file.exists(file))
  expect_equal(as.numeric(rmdcount(file, exclude='')[,2:5]), c(56, 226, 1797, 1797),
               tolerance=1)
})

test_that("defaultpdf", {
  file <- file.path(system.file("rmarkdown", 'defaultpdf.Rmd', package="rmdwc"))
  expect_true(file.exists(file))
  expect_equal(as.numeric(rmdcount(file, exclude='')[,2:5]), c(15, 32, 231, 230),
               tolerance=1)
})

test_that("dozen", {
  file <- file.path(system.file("rmarkdown", 'dozen.Rmd', package="rmdwc"))
  expect_true(file.exists(file))
  expect_equal(as.numeric(rmdcount(file, exclude='')[,2:5]), c(47, 148, 1339, 1339),
               tolerance=1)
})

test_that("example_noecho", {
  file <- file.path(system.file("rmarkdown", 'example_noecho.Rmd', package="rmdwc"))
  expect_true(file.exists(file))
  expect_equal(as.numeric(rmdcount(file, exclude='')[,2:5]), c(2, 7, 44, 44),
               tolerance=1)
})

test_that("example_plot", {
  file <- file.path(system.file("rmarkdown", 'example_plot.Rmd', package="rmdwc"))
  expect_true(file.exists(file))
  expect_equal(as.numeric(rmdcount(file, exclude='')[,2:5]), c(2, 5, 51, 51),
               tolerance=1)
})

test_that("example", {
  file <- file.path(system.file("rmarkdown", 'example.Rmd', package="rmdwc"))
  expect_true(file.exists(file))
  expect_equal(as.numeric(rmdcount(file, exclude='')[,2:5]), c(2, 6, 32, 32),
               tolerance=1)
})

test_that("gettext", {
  file <- file.path(system.file("rmarkdown", 'gettext.Rmd', package="rmdwc"))
  expect_true(file.exists(file))
  expect_equal(as.numeric(rmdcount(file, exclude='')[,2:5]), c(14, 26, 288, 288),
               tolerance=1)
})

test_that("gss92", {
  file <- file.path(system.file("rmarkdown", 'gss92.Rmd', package="rmdwc"))
  expect_true(file.exists(file))
  expect_equal(as.numeric(rmdcount(file, exclude='')[,2:5]), c(56, 238, 1879, 1878),
               tolerance=1)
})

test_that("index", {
  file <- file.path(system.file("rmarkdown", 'index.Rmd', package="rmdwc"))
  expect_true(file.exists(file))
  expect_equal(as.numeric(rmdcount(file, exclude='')[,2:5]), c(28, 176, 1482, 1482),
               tolerance=1)
})

test_that("life92", {
  file <- file.path(system.file("rmarkdown", 'life92.Rmd', package="rmdwc"))
  expect_true(file.exists(file))
  expect_equal(as.numeric(rmdcount(file, exclude='')[,2:5]), c(61, 277, 2218, 2217),
               tolerance=1)
})

test_that("olympic", {
  file <- file.path(system.file("rmarkdown", 'olympic.Rmd', package="rmdwc"))
  expect_true(file.exists(file))
  expect_equal(as.numeric(rmdcount(file, exclude='')[,2:5]), c(53, 217, 1560, 1558),
               tolerance=1)
})

test_that("rstudio_pdf", {
  file <- file.path(system.file("rmarkdown", 'rstudio_pdf.Rmd', package="rmdwc"))
  expect_true(file.exists(file))
  expect_equal(as.numeric(rmdcount(file, exclude='')[,2:5]), c(36, 141, 919, 919),
               tolerance=1)
})

test_that("sas_body", {
  file <- file.path(system.file("rmarkdown", 'sas_body.Rmd', package="rmdwc"))
  expect_true(file.exists(file))
  expect_equal(as.numeric(rmdcount(file, exclude='')[,2:5]), c(44, 111, 929, 929),
               tolerance=1)
})

test_that("titanic", {
  file <- file.path(system.file("rmarkdown", 'titanic.Rmd', package="rmdwc"))
  expect_true(file.exists(file))
  expect_equal(as.numeric(rmdcount(file, exclude='')[,2:5]), c(58, 241, 1853, 1841),
               tolerance=1)
})
