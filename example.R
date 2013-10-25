# example.R

## This works in a windows environment with LaTeX

makeReport = function()
{
  require(knitr)
  options(rstudio.markdownToHTML = 
            function(inputFile, outputFile) {      
              system(paste("mmd", inputFile, " > ", outputFile))
            }
          # Allows footnotes
  )
  require("markdown")
  require("pander")
  require("ggplot2")
  knit2html("report.Rmd")
  
  infile <- "report"
  outfile <- "report"
  
  pandocLoc = "C:\\Users\\ojessen\\AppData\\Local\\Pandoc\\"
  # pandoc is not on my system path
  
  success = c()
  msg = paste0(pandocLoc,"pandoc -o ", outfile, ".docx ", infile, ".md")
  success = c(success,system(msg, intern = TRUE))
  msg = paste0(pandocLoc,"pandoc -o ", outfile, ".pdf ", infile, ".md")
  success = c(success,system(msg, intern = TRUE))
  if(length(success)==0)
  {
    return(TRUE)
  } else
  {
    return(FALSE)
  }
}
makeReport()
