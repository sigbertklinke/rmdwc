# rmdwc #

If you are using R Markdown documents then you have sometimes restrictions about the size of the documents, e.g. number of words, number of characters or non-whitespace characters. rmdcount() computes these counts and returns the result as data frame.

```r
# Count the number of words, number of characters or non-whitespace characters of files
library("rmdwc")
files <- system.file('rmarkdown/rstudio_pdf.Rmd', package="rmdwc")
rmdcount(files)
# Within a R Markdown document in a code chunk
# ```{r}
# library("rmdwc")
# rmdcount()
# ```

```

