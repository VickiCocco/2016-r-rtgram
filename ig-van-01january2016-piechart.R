library(ggplot2)
data3 = read.csv(
  file="https://raw.githubusercontent.com/rtanglao/2016-rtgram/master/01january2016-ig-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv", 
    stringsAsFactors=F)
p = ggplot(data=data3, 
       aes(x=factor(1),
           y=colour,
           fill = I(data3$colour)
      ),
) + theme_void()
p=p + geom_bar(stat="identity", width = 1)
p=p+facet_wrap(~hour, nrow=4,ncol=6)
p = p + coord_polar(theta="y")
 p = p + xlab('') +
     ylab('')
ggsave("ig-van-01january-2016-barchart.png", p, width = 26.666666667*2, height = 26.666666667*2, dpi = 72, limitsize = FALSE) # 26.6666667 = 1920/72dpi
