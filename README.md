# 2016-r-rtgram
R stuff for instagram vancouver 2016

## August 6, 2016

1. ```mkdir JANUARY 2016; cd !$; cp ../january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv .```
1. ```../splitCSVForAMonthInto31CSFfiles.rb january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv ```
1. ```ls -1 *-january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv  | xargs -n 1 Rscript ../colourname-void-piechart-from-csv.R```
1. ```ls -1 *.png > 31pngs.txt```
1. ```gm montage -verbose -adjoin -tile 7x6 +frame +shadow +label -adjoin -geometry '1920x1920+0+0<' null: null: null: null: null: @31pngs.txt null: null: null: null: null: null: 01-31january2016-piechart.png```

## August 1, 2016
[How to make a named character vector in R](http://rolandtanglao.com/2016/08/01/p1-howto-named-character-vector/) - useful if we ever want have a legend with colours in a pie chart.

## July 31, 2016 

1. hourly failed but i got it working!
1. ```Rscript scale-color-manual-first3-ig-van01january2016-piechart.R```
more info:
http://rolandtanglao.com/2016/07/31/p3-simplest-ggplot2-pie-chart-with-colors-as-bar-values-and-a-legend/

## July 27, 2016
1. let's try hourly ```Rscript ig-van-01january2016-piechart.R ```
1. output: ig-van-01january-2016-barchart.png

## July 25, 2016

today let's try theme_void() - it's great! removed all chrome!

1. ```Rscript ig-van-january2016-piechart-as-barchart.R``` # output ig-van-january-2016-piechart-as-barchart.png
1. ```mv ig-van-january-2016-barchart.png theme-void-ig-van-january-2016-barchart.png```
![theme_void() small multiples vancouver 2016 january piechart](https://c1.staticflickr.com/9/8830/28270132710_2564fab5cb_d.jpg "theme_void() small multiples vancouver 2016 january piechart")

## July 23, 2016

1. ```Rscript ig-van-january2016-piechart-as-barchart.R``` # output ig-van-january-2016-piechart-as-barchart.png
1. ```Rscript ig-van-january2016-piechart.R``` #output ig-van-january-2016-barchart.png There's a  BUG in layout of small multiples
hmmm lots of bugs? is there a bug in my script or in my data that causes the large white slices in the following output png:<br/>
![small multiples vancouver 2016 january piechart](https://c1.staticflickr.com/9/8507/27900184084_4b7bfe84bc_d.jpg "small multiples vancouver 2016 january piechart")

