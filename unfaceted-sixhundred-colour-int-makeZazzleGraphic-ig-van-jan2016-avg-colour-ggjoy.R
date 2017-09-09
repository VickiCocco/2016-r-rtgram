library(tidyverse)
library(plotrix)
library(ggjoy)
library(R.utils)

args <- commandArgs(asValue=TRUE)

getnumericColour <-
  function(colorname) {
    colour_matrix=col2rgb(colorname)
    return(as.numeric(colour_matrix[1,1]) * 65536 +
             as.numeric(colour_matrix[2,1]) * 256 +
             as.numeric(colour_matrix[3,1]))
  }
main <- function() {

  csv_url = 
    "https://raw.githubusercontent.com/rtanglao/2016-r-rtgram/master/JANUARY2016/january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour-colourname.csv"
  
  average_colour_ig_van_jan2016 = 
    read_csv(csv_url)
  
  sixhundred_colour_int_ig_van_june2016_average_colour <-
    average_colour_ig_van_jan2016 %>% 
    rowwise() %>%
    mutate(sixhundred_colourint = getnumericColour(colourname))

  colour_hex_strings_all <-
    sapply(sixhundred_colour_int_ig_van_june2016_average_colour$sixhundred_colourint, 
      function(x){
        sprintf("#%6.6X", x)})
  
  colour_named_vector <- 
    setNames(as.character(colour_hex_strings_all),
             colour_hex_strings_all)
  
  p =
    ggplot(
      sixhundred_colour_int_ig_van_june2016_average_colour, 
      aes(x=hour, y= sixhundred_colourint, height=..density..))+
    geom_joy(scale=16, aes(colour=colour_named_vector, fill=colour_named_vector)) +
    scale_colour_manual(values=colour_named_vector)+ 
    scale_fill_manual(values=colour_named_vector)+
    theme_void()+theme(legend.position = 'none') +
    theme(strip.background = element_blank(),strip.text.x = element_blank())
  
  filename = sprintf("%d-%s", as.integer(Sys.time()),gsub("R", "png", basename(args$file)))
  
  ggsave(filename,
         p,
         width = 14,
         height = 12,
         dpi = 150,
         limitsize = FALSE) #multiply height and width by dpi to get px
}

sink("log.txt")

main()

sink()

  