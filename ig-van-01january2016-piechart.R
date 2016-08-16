library(ggplot2)
data3 = read.csv(
  file="01january2016-ig-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv", 
    stringsAsFactors=F)
p = ggplot(data=data3, 
       aes(x=factor(1), fill=I(colour)
      ),
           )
p= p + geom_bar(stat="count", width=1)
p = p + coord_polar(theta="y", start=0)
p=p+facet_wrap(~hour, nrow=4,ncol=6)

ggsave("ig-van-01january-2016-piechart.png", p, width = 26.666666667, height = 26.666666667, dpi = 72, limitsize = FALSE) # 26.6666667 = 1920/72dpi
warnings()
