# 2016-r-rtgram
R stuff for instagram vancouver 2016

## August 31, 2016 

### Let's try 0.1 and divide by 5
1. ```cd /Users/rtanglao/Dropbox/GIT/2016-r-rtgram/JANUARY2016/DIV5-SIZE0.1```
1. ```mkdir TRIMMED```
1. ```ls -1 ../*-january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv | xargs -n 1 Rscript ../../div5-size0.1-first2500-void-square-piechart-from-csv.R```
1. ```parallel convert -trim '{}' 'TRIMMED/{}' ::: first2500-div5-size0.1-*.png```


### Let's try 0.1 and divide by 10

1. ```cd /Users/rtanglao/Dropbox/GIT/2016-r-rtgram/JANUARY2016/DIV10-SIZE0.1```
1. ```ls -1 ../*-january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv | xargs -n 1 Rscript ../../div10-size0.1-first2500-void-dquare-piechart-from-csv.R```
1. ```mkdir TRIMMED```
1. ```parallel convert -trim '{}' 'TRIMMED/{}' ::: first2500-div10-size0.1-square-piechart-colourname-*.png```

### Tried 0.1 it's better but still missing some datapoints

1. ```cd /Users/rtanglao/Dropbox/GIT/2016-r-rtgram/JANUARY2016/SIZE0.1```
1. ```ls -1 ../*-january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv | xargs -n 1 Rscript ../../size0.1.-first2500-void-square-piechart-from-csv.R```
1. ```mkdir TRIMMED```
1. ```parallel convert -trim '{}' 'TRIMMED/{}' ::: first2500-size0*.png```

## August 30, 2016 
### Let's make 1000 square graphs
1. use cumsum to compute a cumulative sum column  ``sept01countcolourname$numphotos <- cumsum(sept01countcolourname$freq)```
1. then use head with a conditional on the cumulative sum get first 2000 ```subset(sept01countcolourname, sept01countcolourname$numphotos <2001)```
### Let's make 2500 photos NOT 2501 31 square pie charts for january 2016
* fixed bug changed 2501 to 2500!

1. ```cd /Users/rtanglao/Dropbox/GIT/2016-r-rtgram/JANUARY2016```
1. ``````ls -1 *-january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv | xargs -n 1 Rscript ../first2500-colourname-void-square-piechart-from-csv.R```
1. ```parallel convert -trim '{}' 'FIRST2500-TRIMMED/{}' ::: first2500*.png```
### Creating 6 point square piechart
1. ```Rscript first6-ig-van-01january2016-square-piechart.R```
<br />output:
<a data-flickr-embed="true"  href="https://www.flickr.com/photos/roland/29056444650/in/dateposted-ff/" title="6datapoints-squarepiechart"><img src="https://c3.staticflickr.com/9/8309/29056444650_5624472f95.jpg" width="500" height="500" alt="6datapoints-squarepiechart"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

## August 28, 2016

### 1st2500:

1. ```cd /Users/rtanglao/Dropbox/GIT/2016-r-rtgram/JANUARY2016```
1. ```ls -1 *-january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv | xargs -n 1 Rscript ../first2500-colourname-void-square-piechart-from-csv.R ```
1. trim off white space: ```mkdir FIRST2500-TRIMMED``` 
1. ```parallel convert -trim '{}' 'FIRST2500-TRIMMED/{}' ::: first2500*.png```
citation: O. Tange (2011): GNU Parallel - The Command-Line Power Tool,
  ;login: The USENIX Magazine, February 2011:42-47.
actually the above is wrong because convert -trim truncates white columns, ok then we should use 1026x475px not trim

### 31 faceted square piecharts just to see how bad the layout will be :-)

1. ```cd /Users/rtanglao/Dropbox/GIT/2016-r-rtgram/JANUARY2016```
1. ```../faceted-by-daynumber-colourname-void-square-piechart-from-csv.R january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv```
1. Use iron() to display all 31? Because it doesn't work, maybe [because faceting isn't supported](https://github.com/hrbrmstr/waffle/issues/24)?: ```Error in layout_base(data, vars, drop = drop) : 
  At least one layer must contain all variables used for facetting```

## August 14, 2016
### Let's make 31 square pie charts for january 2016

1. ```cd /Users/rtanglao/Dropbox/GIT/2016-r-rtgram/JANUARY2016```
1. ```ls -1 *-january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv | xargs -n 1 Rscript ../colourname-void-square-piechart-from-csv.R ```

### Simplest possible square pie chart

1. ```Rscript first3-ig-van-01january2016-square-piechart.R``` # theme_void doesn't work, gives us 1 colour only!
1.  ```open 1st3-ig-van-01january-2016-squarepiechart.png```
output:
<a data-flickr-embed="true"  href="https://www.flickr.com/photos/roland/28873317972/in/dateposted-ff/" title="1st3-ig-van-01january-2016-squarepiechart"><img src="https://c5.staticflickr.com/9/8062/28873317972_98a1bb6e0a.jpg" width="500" height="500" alt="1st3-ig-van-01january-2016-squarepiechart"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

## August 6, 2016

1. ```mkdir JANUARY 2016; cd !$; cp ../january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv .```
1. ```../splitCSVForAMonthInto31CSFfiles.rb january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv ```
1. ```ls -1 *-january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv  | xargs -n 1 Rscript ../colourname-void-piechart-from-csv.R```
1. ```ls -1 *.png > 31pngs.txt```
1. ```gm montage -verbose -adjoin -tile 7x6 +frame +shadow +label -adjoin -geometry '1920x1920+0+0<' null: null: null: null: null: @31pngs.txt null: null: null: null: null: null: 01-31january2016-piechart.png``` # Week starts on a Sunday and January 1 is a Friday so add 5 nulls at the beginning, January 31 is a Sunday so add 6 nulls at the end
1. ```gm convert 01-31january2016-piechart.png 01-31january2016-piechart.jpg```# And post jpeg to flickr :-)

### Output
<a data-flickr-embed="true"  href="https://www.flickr.com/photos/roland/28202375273/in/dateposted-ff/" title="31 circles almost all alike :-) 31 jpegs fri jan 1 - sun jan 31 2016 instagram vancouver average colour pie charts 01-31january2016-piechart"><img src="https://c2.staticflickr.com/9/8889/28202375273_9d3d974548.jpg" width="500" height="429" alt="31 circles almost all alike :-) 31 jpegs fri jan 1 - sun jan 31 2016 instagram vancouver average colour pie charts 01-31january2016-piechart"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

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

