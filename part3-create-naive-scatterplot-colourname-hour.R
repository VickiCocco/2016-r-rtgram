library(tidyverse)

csv_url = "https://raw.githubusercontent.com/rtanglao/2016-r-rtgram/master/JANUARY2016/january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour-colourname.csv"
average_colour_ig_van_jan2016_colourname = read_csv(csv_url)
plot =
    ggplot(data=average_colour_ig_van_jan2016_colourname)+
    geom_point(mapping = aes(x = hour, y=colourname))
filename = "part3-naive-january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour-colourname.png"
  ggsave(filename,
         plot,
         width = 53.333333333,
         height = 29.069444444,
         dpi = 72,
         limitsize = FALSE,
         bg = "transparent"
         ) #multiply height and width by dpi to get px of 16800*2093
