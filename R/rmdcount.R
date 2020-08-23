#' Word, character and non-whitespace characters count
#'
#' Counts words, characters and non-whitespace characters in R Markdown files.
#'
#' @param files character: file name(s)
#' @param space character: pattern to split a text at spaces (default: \code{'[[:space:]]'})
#' @param word character: pattern to split a text at word boundaries (default: \code{'[[:space:]]+'})
#'
#' @details It uses the following approaches to detect words, characters and non-whitespace characters. 
#' 
#' \describe{
#' \item{words}{\code{strsplit(rmd, word)[[1]]} with \code{word} equal to \code{'[[:space:]]+'}}
#' \item{characters}{\code{strsplit(rmd, '')[[1]]}}
#' \item{non-whitespace characters}{\code{strsplit(gsub(space, '', rmd), '')[[1]]} with \code{space} equal to \code{'[[:space:]]'}}
#' }
#' 
#' This is repeated for the text without code chunks. Code chunks are deleted with \code{gsub('```\\\{.*?```', '', rmd)}.
#' 
#' @return a data frame wthe following elements
#' \describe{
#' \item{file}{basename of a file}
#' \item{words}{number of words including code chunks}
#' \item{chars}{number of characters including code chunks}
#' \item{nonws}{number of non-whitespace characters including code chunks}
#' \item{words_chunk}{number of words excluding code chunks}
#' \item{chars_chunk}{number of characters excluding code chunks}
#' \item{nonws_chunk}{number of non-whitespace characters excluding code chunks}
#' \item{path}{path of a file}
#' }
#' 
#' @importFrom knitr current_input
#' @export
#'
#' @examples
#' files <- system.file('rmarkdown/rstudio_pdf.Rmd', package="rmdwc")
#' rmdcount(files)
#' # use of rmdcount() in a R Markdown document 
#' if (interactive()) {
#'   file.edit(files) # SAVE(!) the file and knit it 
#' }
rmdcount <- function(files=NULL, space='[[:space:]]', word='[[:space:]]+') {
  if (is.null(files)) files <- knitr::current_input()
  zero <- rep(0, length(files))
  dfwc <- list(file=NULL, words=zero, chars=zero, nonws=zero, 
               words_chunk=zero, chars_chunk=zero, nonws_chunk=zero,
               path=NULL)
  i <- 0
  for (file in files) {
    i     <- i+1
    fcont <- readChar(file, file.info(file)$size)
    wcl   <- rmdwcl(fcont, space, word)
    for (elem in names(wcl)) dfwc[[elem]][i] <- length(wcl[[elem]])
  }
  dfwc[['file']] <- basename(files)
  dfwc[['path']] <- dirname(files)
  as.data.frame(dfwc)
}