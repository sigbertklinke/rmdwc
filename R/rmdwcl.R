#' Word-, character and non-whitespace characters count for a text
#' 
#' Counts words, characters and non-whitespace characters in a string. Is used in \code{rmdcount}, see details there.
#' 
#' @param rmd character: R Markdown document as string 
#' @param space character: pattern to split a text at spaces (default: \code{'[[:space:]]'})
#' @param word character: pattern to split a text at word boundaries (default: \code{'[[:space:]]+'})
#' @param line character: pattern to split lines (default: \code{'\n'})
#'
#' @return a list
#' @export
#'
#' @examples
#' file  <- system.file('rmarkdown/rstudio_pdf.Rmd', package="rmdwc")
#' fcont <- readChar(file, file.info(file)$size)
#' rmdwcl(fcont)
rmdwcl <- function (rmd, space='[[:space:]]', word='[[:space:]]+', line="\n") {
  list(lines          = strsplit(rmd, line)[[1]],
       words          = strsplit(rmd, word)[[1]],
       bytes          = charToRaw(rmd),
       chars          = strsplit(rmd, '')[[1]],
       nonws          = strsplit(gsub(space, '', rmd), '')[[1]]
  )
}