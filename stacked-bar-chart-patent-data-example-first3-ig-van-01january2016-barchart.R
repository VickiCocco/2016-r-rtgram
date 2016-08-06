# from http://poldham.github.io/ggplot_pizza_patents_part2j/
library(ggplot2)
data3 = read.csv(
  file="01january2016-1st3datapoints.csv", 
    stringsAsFactors=F)
p = ggplot(data=data3, 
       aes(x=1, y=colour, fill=I(colour)
      ),
           ) + geom_bar(stat="identity")

ggsave("stacked-bar-chart-patent-data-example-1st3-ig-van-01january-2016-barchart.png", p, width = 26.666666667, height = 26.666666667, dpi = 72, limitsize = FALSE) # 26.6666667 = 1920/72dpi
warnings()
