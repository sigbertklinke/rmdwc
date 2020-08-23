#' Word-, character and non-whitespace characters count for a text
#' 
#' Counts words, characters and non-whitespace characters in a string. Is used in \code{rmdcount}, see details there.
#' 
#' @param rmd character: R Markdown document as string 
#' @param space character: pattern to split a text at spaces (default: \code{'[[:space:]]'})
#' @param word character: pattern to split a text at word boundaries (default: \code{'[[:space:]]+'})
#'
#' @return a list
#' @export
#'
#' @examples
#' file  <- system.file('rmarkdown/rstudio_pdf.Rmd', package="rmdwc")
#' fcont <- readChar(file, file.info(file)$size)
#' rmdwcl(fcont)
rmdwcl <- function (rmd, space='[[:space:]]', word='[[:space:]]+') {
  fcont <- gsub('```\\{.*?```', '', rmd) 
  list(words          = strsplit(rmd, word)[[1]],
       chars          = strsplit(rmd, '')[[1]],
       nonws          = strsplit(gsub(space, '', rmd), '')[[1]],
       words_chunk    = strsplit(fcont, word)[[1]],
       chars_chunk    = strsplit(fcont, '')[[1]],
       nonws_chunk    = strsplit(gsub(space, '', fcont), '')[[1]]
  )
}