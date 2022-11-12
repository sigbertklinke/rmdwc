# rmdwc 

If you are using R Markdown documents then you have sometimes restrictions about the size of the documents, e.g. number of words, number of characters or non-whitespace characters. `rmdcount` computes these counts and returns the result as data frame. 

```r
## Count the number of words, number of characters or non-whitespace characters of files
library("rmdwc")
files <- system.file('rmarkdown/rstudio_pdf.Rmd', package="rmdwc")
rmdcount(files) # exclude code chunks
txtcount(files) # include code chunks

## Within a R Markdown document in a code chunk
# ```{r}
# library("rmdwc")
# rmdcount()
# ```

## After loading the library go in RStudio to "Addins" -> RMDWC
# If the current document is a R Markdown file then it will count and send the result to the console
```

# Installation  

## From CRAN

```R
install.packages("rmdwc")
```

## From github

Note that from github you install the current development version.

```R
library("devtools")
install_github("sigbertklinke/rmdwc")
```

# History

* 12 Nov 2022 - Added the RStudio addin