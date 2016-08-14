library(ggplot2)
library(waffle)

data3 = read.csv(
  file="01january2016-1st3datapoints.csv", 
    stringsAsFactors=F)

colour_vector <-setNames(c(1,1, 1), data3$colour)

p = waffle(colour_vector, rows=1, size=0.5, 
    colors=I(data3$colour))

ggsave("1st3-ig-van-01january-2016-squarepiechart.png", p, width = 26.666666667, height = 26.666666667, dpi = 72, limitsize = FALSE) # 26.6666667 = 1920/72dpi
warnings()
