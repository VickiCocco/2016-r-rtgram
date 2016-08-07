library(ggplot2)
library(plotrix)
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
      what to grep for also what to name the file
      --help              - print this text 
      Example:
      Rscript void-piechart-from-csv R 001_ThuJan1.csv\n\n")
  q(save="no")
}
data3 = read.csv(file=args[1], stringsAsFactors=F)
data3$colourname <- sapply(data3$colour, tc)

p = ggplot(data=data3, 
       aes(x=factor(1), fill=I(colourname)))
p= p + geom_bar(stat="count", width=1)
p = p + coord_polar(theta="y", start=0)
p = p + theme_void()
ggsave(paste0("colourname-",gsub("csv", "png", basename(args[1]))), p, width = 26.666666667, height = 26.666666667, dpi = 72, limitsize = FALSE) # 26.6666667 = 1920/72dpi
warnings()
