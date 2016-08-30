library(ggplot2)
library(waffle)
library(plotrix)
library(plyr)

tc <-
     function(x) {
         return (head(color.id(x),n=1))
     }

data6 = read.csv(
  file="6datapoints-01jan2016.csv",
    stringsAsFactors=F)

data6$colourname <- sapply(data6$colour, tc)

countcolourname = count(data6, "colourname")
countcolourname <- countcolourname[order(-countcolourname$freq),]

colour_vector <-setNames(countcolourname$freq, countcolourname$colourname)
p = waffle(colour_vector, rows=1, size=0.5, 
    colors=I(data6$colour))

ggsave("6datapoints-squarepiechart.png", p, width = 26.666666667, height = 26.666666667, dpi = 72, limitsize = FALSE) # 26.6666667 = 1920/72dpi
warnings()
