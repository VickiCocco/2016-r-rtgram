library(ggplot2)
library(plotrix)
library(plyr)
library(ggjoy)

tc <- function(x) {
  return (head(color.id(x), n = 1))
}

printf <- function(...) {
  invisible(print(sprintf(...)))
}

args <- commandArgs(TRUE)

## Default setting when no arguments passed
if (length(args) < 1) {
  args <- c("--help")
}
if ("--help" %in% args) {
  cat(
    "
    Arguments:
    CSV file with a column with colour with hex values for colours
    --help              - print this text
    Example:
    Rscript average-colour-by-hour-ggjoy-from-csv.R JANUARY2016/january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv\n\n"

  )
  q(save = "no")
}

main <- function() {
  data3 = read.csv(file = args[1], stringsAsFactors = F)
  data3$colourname <- sapply(data3$colour, tc)

  print(head(data3))

  p = ggplot(data3, aes(x = hour, y = colourname, stat= "identity")) +
      geom_joy()+
      ## geom_joy(scale = 3, rel_min_height = 0.01) +
      scale_y_discrete(expand = c(0.01, 0)) +   # will generally have to set the `expand` option
      ## scale_x_continuous(expand = c(0.01, 0)) +
      ## scale_y_discrete(expand = c(0.01, 0)) +
      labs(title = 'Average Colour',
           subtitle = 'Instagram 2016 Vancouver') +
      theme_joy(font_size = 13, grid = T) + theme(axis.title.y = element_blank())

  filename = sprintf("ggjoy-instagram-average-colour-%s", gsub("csv", "png", basename(args[1])))

  ggsave(filename,
         p,
         width = 14.222222222,
         height =10.666666667,
         dpi = 72,
         limitsize = FALSE) #multiply height and width by dpi to get px
  
  ## print(head(data3, 64))
  ## data3$linear_colour_matrix <- lapply(data3$colour, get_linear)
  ## df <- data.frame(colourname = character(24), stringsAsFactors = FALSE)
  ## for (i in 0:23) {
  ##   colourname = getcolour_for_hour(data3, i)
  ##   df$colourname[i+1] <- colourname
  ## }
  
  ## print (df)
  
  ## countcolourname = count(df, "colourname")
  ## countcolourname <- countcolourname[order(-countcolourname$freq), ]
  
  ## colour_vector2 <- setNames(countcolourname$freq, countcolourname$colourname)
  ## print(colour_vector2)
  ## print(sum(colour_vector2))
  ## p = roland_waffle(
  ##   colour_vector2,
  ##   rows = 4,
  ##   size = 1.0,
  ##   colors = countcolourname$colourname) +
  ##   theme(legend.position = "none")

  ## filename = sprintf("24squares-per-hour-%s", gsub("csv", "png", basename(args[1])))
  ## ggsave(filename,
  ##        p,
  ##        width = 14.222222222,
  ##        height =10.666666667,
  ##        dpi = 72,
  ##        limitsize = FALSE) #multiply height and width by dpi to get px
}

sink("log.txt")

main()

sink()
