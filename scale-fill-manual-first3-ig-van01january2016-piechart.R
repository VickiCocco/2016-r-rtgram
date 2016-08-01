library(ggplot2)
data3 = read.csv(
  file="01january2016-1st3datapoints.csv", 
    stringsAsFactors=F)
p = ggplot(data=data3, 
       aes(x=factor(1), fill=colour
      ),
           )
p= p + geom_bar(stat="count", width=1)
p = p + coord_polar(theta="y", start=0)
p=p+theme_void()
p = p + scale_fill_manual(values=c("#8B7D7D" = "#8B7D7D", "#4C3F3F" = "#4C3F3F", "#716666" = "#716666"))

ggsave("scale-fill-manual-1st3-ig-van-01january-2016-piechart.png", p, width = 26.666666667, height = 26.666666667, dpi = 72, limitsize = FALSE) # 26.6666667 = 1920/72dpi
warnings()
