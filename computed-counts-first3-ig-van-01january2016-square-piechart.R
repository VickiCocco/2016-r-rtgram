library(ggplot2)
library(waffle)
library(plotrix)
library(plyr)

tc <-function(x) {
    return (head(color.id(x),n=1))
}

data3 = read.csv(
  file="01january2016-1st3datapoints.csv", 
    stringsAsFactors=F)

data3$colourname <- sapply(data3$colour, tc)
countcolourname = count(data3, "colourname")
countcolourname <- countcolourname[order(-countcolourname$freq),]

colour_vector2 <-setNames(countcolourname$freq, countcolourname$colourname)

p = waffle(colour_vector2, rows=1, size= 0.5, colors = countcolourname$colourname) + theme_void() + theme(legend.position="none")

ggsave("computed-counts-1st3-ig-van-01january-2016-squarepiechart.png", p, width = 26.666666667, height = 26.666666667, dpi = 72, limitsize = FALSE) # 26.6666667 = 1920/72dpi
warnings()
