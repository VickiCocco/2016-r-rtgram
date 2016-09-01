library(ggplot2)
library(plotrix)
library(plyr)
library(waffle)
library(grid)

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
data3 = head(data3,2500)

data3$colourname <- sapply(data3$colour, tc)

countcolourname = count(data3, "colourname")
countcolourname <- countcolourname[order(-countcolourname$freq),]
#sum(countcolourname$freq)
#head(countcolourname,10)

colour_vector2 <-setNames(countcolourname$freq, countcolourname$colourname)
colour_vector2
sum(colour_vector2)

p = waffle(colour_vector2 / 5 , rows=25, size= 0.1, colors = countcolourname$colourname) +
    # theme_void() +
        #theme(legend.title = element_blank()) +
# Remove the plot legend
 theme(legend.position="none") +
       # theme(legend.justification=c(1,0), legend.position=c(1,0)) +
    #theme(legend.position="none") +
     labs(x=NULL, y=NULL) +
         # theme(plot.margin = unit(c(0,0,0,0), "mm")) + 
         theme(plot.margin=grid::unit(c(0,0,0,0), "mm")) +
         theme(axis.title.x=element_blank()) +
             theme(axis.title.y=element_blank())+
            guides(fill=FALSE)

ggsave(paste0("first2500-div5-size0.1-square-piechart-colourname-",gsub("csv", "png", basename(args[1]))), p,
       width = 14.25, height = 6.66667, dpi = 72, limitsize = FALSE) #multiply height and width by dpi to get px
warnings()
