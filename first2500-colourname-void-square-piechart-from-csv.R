library(ggplot2)
library(plotrix)
library(plyr)
library(waffle)

tc <-
     function(x) {
         return (head(color.id(x),n=1))
     }
args <- commandArgs(TRUE)
 
## Default setting when no arguments passed
if(length(args) < 1) {
  args <- c("--help")
}
if("--help" %in% args) {
  cat(" 
      Arguments:
      CSV file with a column with colour with hex values for colours
      --help              - print this text 
      Example:
      Rscript first2500-colourname-void-square-piechart-from-csv R 001_ThuJan1.csv\n\n")
  q(save="no")
}
data3 = read.csv(file=args[1], stringsAsFactors=F)
data3 = head(data3,2501)

data3$colourname <- sapply(data3$colour, tc)

countcolourname = count(data3, "colourname")
countcolourname <- countcolourname[order(-countcolourname$freq),]

colour_vector2 <-setNames(countcolourname$freq, countcolourname$colourname)

p = waffle(colour_vector2, rows=25, size= 0.5, colors = countcolourname$colourname) + theme_void() + theme(legend.position="none")

ggsave(paste0("first2500-square-piechart-colourname-",gsub("csv", "png", basename(args[1]))), p, width = 26.666666667, height = 26.666666667, dpi = 72, limitsize = FALSE) # 26.6666667 = 1920/72dpi
warnings()
