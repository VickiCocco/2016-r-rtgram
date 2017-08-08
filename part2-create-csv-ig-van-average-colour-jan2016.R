library(tidyverse)
library(plotrix)

tc <- function(x) {
  return (head(color.id(x), n = 1))
}

main <- function() {
    csv_url = "https://raw.githubusercontent.com/rtanglao/2016-r-rtgram/master/JANUARY2016/january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv"
    average_colour_ig_van_jan2016 = read_csv(csv_url)
    print(average_colour_ig_van_jan2016)
    # the following line of code doesn't work because mutate just does the first value of the column
    # average_colour_ig_van_jan2016_with_colourname = mutate(average_colour_ig_van_jan2016, colourname = tc(colour))
   average_colour_ig_van_jan2016_with_colourname =  average_colour_ig_van_jan2016 %>% 
       rowwise() %>% 
       mutate(colourname = tc(colour))
    write_csv(average_colour_ig_van_jan2016_with_colourname,
              "january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour-colourname.csv")
}

sink("log.txt")

main()

sink()



