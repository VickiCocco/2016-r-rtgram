library(ggplot2)
data3 = read.csv(
  file="01january2016-1st3datapoints.csv", 
    stringsAsFactors=F)
p = ggplot(data=data3, 
       aes(x=colour, fill=I(colour)
      ),
           )
p= p + geom_bar(stat="count")


ggsave("1st3-ig-van-01january-2016-barchart.png", p, width = 26.666666667, height = 26.666666667, dpi = 72, limitsize = FALSE) # 26.6666667 = 1920/72dpi
warnings()
