library(tidyverse)
library(plotrix)
library(ggjoy)
library(R.utils)

args <- commandArgs(asValue=TRUE)

main <- function() {

  csv_url = 
    "https://raw.githubusercontent.com/rtanglao/2016-r-rtgram/master/JANUARY2016/january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour-colourname.csv"
  
  average_colour_ig_van_jan2016 = 
    read_csv(csv_url)
  
  colour_named_vector <-
    setNames(as.character(average_colour_ig_van_jan2016$colourname), 
             average_colour_ig_van_jan2016$colourname)
  p =
    ggplot(average_colour_ig_van_jan2016, aes(x=hour, y= colourname , height=..density..))+
    geom_joy(scale=16, aes(colour=colour_named_vector, fill=colour_named_vector)) +
    scale_colour_manual(values=colour_named_vector)+ 
    scale_fill_manual(values=colour_named_vector)+
    theme_void()+theme(legend.position = 'none') +
    theme(strip.background = element_blank(),strip.text.x = element_blank())+
    facet_wrap(~ daynumber, nrow = 1) 
  
  filename = sprintf("%d-%s", as.integer(Sys.time()),gsub("R", "png", basename(args$file)))
  
  ggsave(filename,
         p,
         width = 29.166666667,
         height = 25,
         dpi = 72,
         limitsize = FALSE) #multiply height and width by dpi to get px
  
}

sink("log.txt")

main()

sink()

  