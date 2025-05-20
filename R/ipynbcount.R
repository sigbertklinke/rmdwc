#' Count text elements in Jupyter Notebook files
#'
#' This function extracts text from specific cell types (e.g., markdown) in one or more `.ipynb` files
#' and counts the number of characters, words, and lines. It optionally excludes certain patterns (e.g., code fences).
#' The function uses a helper function `rmdcount()` to perform the counting on the extracted text.
#'
#' @param files character: vector of paths to `.ipynb` (Jupyter Notebook) files.
#' @param celltype character: vector indicating which cell types to include (default is `'markdown'`). Valid values include `'markdown'` and `'code'`.
#' @inheritParams rmdcount
#' 
#' @return A data frame with counts of characters, words, and lines for each file. Additional columns include `file` (base name) and `path` (directory).
#'
#' @details
#' This function assumes that the notebook files are valid JSON and contain a list of cells under the `cells` field.
#' It temporarily writes the extracted content to a file to reuse the `rmdcount()` logic.
#'
#' @examples
#' file <- system.file('ipynb/example_data_analysis.ipynb', package="rmdwc")
#' ipynbcount(file)                                   # without code
#' ipynbcount(file, celltype=c("markdown", "code"))   # with code
#'
#' @importFrom jsonlite fromJSON
#' @export
ipynbcount <- function(files, celltype=c('markdown'), space='[[:space:]]', word='[[:space:]]+', line="\n", exclude='```\\{.*?```') {
  bnf <- tempfile(pattern=basename(files))
  tf  <- tempfile(pattern=bnf)
  for (i in seq_along(files)) {
    notebook <- fromJSON(files[i], simplifyVector=FALSE)
    all_text <- NULL
    for (ncell in notebook$cells) {
      if (ncell$cell_type %in% celltype) all_text <- c(all_text, unlist(ncell$source))
    }    
    writeLines(all_text, bnf[i])
  }
  df <- rmdcount(bnf, space=space, word=word, line=line, exclude=exclude)
  df[['file']] <- basename(files)
  df[['path']] <- dirname(files)
  df
}
  