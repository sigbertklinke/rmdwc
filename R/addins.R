#' rmdcountAddin
#'
#' Applies `rmdcount` to the current R Markdown document
#'
#' @return nothing
#' @importFrom tools file_ext
#' @importFrom rstudioapi getSourceEditorContext sendToConsole
#' @export
#'
#' @examples
#' if (interactive()) rmdcountAddin()
rmdcountAddin <- function() {
  fileext <- tolower(file_ext(getSourceEditorContext()$path))
  stopifnot(isTRUE(fileext %in% c("Rmd", "rmd")))
  file <- tempfile(fileext=".Rmd")
  writeLines(getSourceEditorContext()$contents, file)
  df <- rmdcount(files=file)
  cmd <- sprintf("data.frame(file='%s', lines=%i, words=%i, bytes=%i, chars=%i, nonws=%i)",
                 basename(getSourceEditorContext()$path), df$lines, df$words, df$bytes, df$chars, df$nonws)    
  sendToConsole(cmd, echo=FALSE)
}