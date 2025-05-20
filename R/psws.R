psws <- function(txt, sentence='[.!?]', word='[[:space:]]+', space="[^A-Za-z0-9.!?\n]", exclude='```\\{.*?```') {
  browser()
  txt <- paste0(txt, collapse="\n")
  if (is.character(exclude)) txt <- gsub(exclude, '', txt)
  txt <- gsub(space, " ", txt)
  txt <- gsub("\t", " ", txt)
  txt <- gsub("\n[ ]+", "\n", txt)
  paragraphs <- strsplit(txt, "\n{2,}")[[1]]
  
  sentences  <- strsplit(paragraphs, sentence)
   
   

  
}

#psws(readLines("/media/local/sk/Seafile/SK_Lehre/CRAN/rmdwc/inst/rmarkdown/titanic.Rmd"))