#' @name rmdcount
#' @title Word, character and non-whitespace characters count
#' @description \code{rmdcount} counts lines, words, bytes, characters and non-whitespace characters in R Markdown files excluding code chunks.
#' \code{txtcount} counts lines, words, bytes, characters and non-whitespace characters in plain text files.\cr
#' Note that the counts may differ a bit from unix \code{wc} and Libre Office because
#' it depends on the definition of a line, a word and a character.
#'
#' @param files character: file name(s)
#' @param space character: pattern to split a text at spaces (default: \code{'[[:space:]]'})
#' @param word character: pattern to split a text at word boundaries (default: \code{'[[:space:]]+'})
#' @param line character: pattern to split lines (default: \code{'\n'})
#' @param exclude character: pattern to exclude text parts, e.g. code chunks (default: \code{'```\\\{.*?```'})
#'
#' @details We define:
#' \describe{
#' \item{Line}{the number of lines. It differs from unix \code{wc -l} since \code{wc} counts the number of newlines.}
#' \item{Word}{it is considered to be a character or characters delimited by white space. However,
#' a "word" is in general a fuzzy concept, for example is "3.141593" a word? 
#' Therefore different programs may count differently, for more details see the discussion to the Libreoffice bug 
#' [Word count gives wrong results - Another Example](https://bugs.documentfoundation.org/show_bug.cgi?id=55359) Comment 5.}
#' }
#' 
#' The following approach is used to detect lines, words, characters and non-whitespace characters. 
#' \describe{
#' \item{lines}{\code{strsplit(rmd, line)[[1]]} with \code{line='\n'}}
#' \item{bytes}{\code{charToRaw(rmd)}}
#' \item{words}{\code{strsplit(rmd, word)[[1]]} with \code{word='[[:space:]]+'}}
#' \item{characters}{\code{strsplit(rmd, '')[[1]]}}
#' \item{non-whitespace characters}{\code{strsplit(gsub(space, '', rmd), '')[[1]]} with \code{space='[[:space:]]'}}
#' }
#' 
#' If \code{txtcount} is used then code chunks are deleted with \code{gsub('```\\\{.*?```', '', rmd)} before counting.
#' 
#' @return a data frame with following elements
#' \describe{
#' \item{file}{basename of file}
#' \item{lines}{number of lines} 
#' \item{words}{number of words}
#' \item{bytes}{number of bytes}
#' \item{chars}{number of characters}
#' \item{nonws}{number of non-whitespace characters}
#' \item{path}{path of file}
#' }
#' 
#' @md
#' @importFrom knitr current_input
#' @export
#'
#' @examples
#' # count excluding code chunks
#' files <- system.file('rmarkdown/rstudio_pdf.Rmd', package="rmdwc")
#' rmdcount(files)
#' # count including code chunks
#' txtcount(files) # or rmdcount(files, exclude='')
#' # count for a set of R Markdown docs
#' files <- list.files(path=system.file('rmarkdown', package="rmdwc"), 
#'                     pattern="*.Rmd", full.names=TRUE)
#' rmdcount(files)
#' # use of rmdcount() in a R Markdown document 
#' if (interactive()) {
#'   files <- system.file('rmarkdown/rstudio_pdf.Rmd', package="rmdwc")
#'   file.edit(files) # SAVE(!) the file and knit it 
#' }
rmdcount <- function(files=NULL, space='[[:space:]]', word='[[:space:]]+', line="\n", exclude='```\\{.*?```') {
  if (is.null(files)) files <- knitr::current_input()
  zero <- rep(0, length(files))
  dfwc <- list(file=NULL, lines=zero, words=zero, bytes=zero, chars=zero, nonws=zero, 
               path=NULL)
  i <- 0
  for (file in files) {
    i     <- i+1
    fcont <- readChar(file, file.info(file)$size)
    if (is.character(exclude)) fcont <- gsub(exclude, '', fcont)
    wcl   <- rmdwcl(fcont, space, word, line)
    for (elem in names(wcl)) dfwc[[elem]][i] <- length(wcl[[elem]])
  }
  dfwc[['file']] <- basename(files)
  dfwc[['path']] <- dirname(files)
  as.data.frame(dfwc)
}

#' @rdname rmdcount
#' @export
#' @examples
#' # count including code chunks
#' files <- system.file('rmarkdown/rstudio_pdf.Rmd', package="rmdwc")
#' txtcount(files)
txtcount <- function(files=NULL, space='[[:space:]]', word='[[:space:]]+', line="\n") {
   rmdcount(files, space=space, word=word, line=line, exclude=NULL)
}