# from http://poldham.github.io/ggplot_pizza_patents_part2j/
# note that x="", x=1, x=factor(1) don't work, i.e. this code results in an erroneous
# piechart (bug is that the slices are not equal, each slice should be 1/3 of the pie chart!), for working code see:
# * http://rolandtanglao.com/2016/07/31/p2-simplest-ggplot2-pie-chart-with-colors-as-bar-values/
# * https://github.com/rtanglao/2016-r-rtgram/blob/master/first3-ig-van-01january2016-piechart.R

library(ggplot2)
data3 = read.csv(
  file="01january2016-1st3datapoints.csv", 
    stringsAsFactors=F)
p = ggplot(data=data3, 
       aes(x="", y=colour, fill=I(colour)
      ))
p = p + geom_bar(stat="identity")
p = p + coord_polar(theta = "y")

ggsave("stacked-pie-chart-patent-data-example-1st3-ig-van-01january-2016-piechart.png", p, width = 26.666666667, height = 26.666666667, dpi = 72, limitsize = FALSE) # 26.6666667 = 1920/72dpi
warnings()
