# 2016-r-rtgram
R stuff for instagram vancouver 2016

## August 7, 2017
* 1\. Giving up on ggjoy for now :-)
* 2\. Back to first principles of R and the tidyverse: http://rolandtanglao.com/2017/08/07/p1-mpg-scatterplot-average-colour-instagram-r-data-science/
* 3\. Create January 1-31, 2016 instagram vancouver CSV with colournames, output file is: https://github.com/rtanglao/2016-r-rtgram/blob/master/JANUARY2016/january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour-colourname.csv:
```bash
cd JANUARY2016
Rscript ../part2-create-csv-ig-van-average-colour-jan2016.R
```
* 4\. Create part 3 naive scatterplot, 
output file is: ```part3-naive-january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour-colourname.png```
```bash
Rscript ../part3-create-naive-scatterplot-colourname-hour.R
```
* 5\. Create part 4 with the dots of the scatterplot coloured like colourname i.e. ```geom_point``` uses the colour name literally (if you put the colour name in ```aes```it will map the colour name to a level!)
output file is: ```part4-colourname-aesthetic-january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour-colourname.png```
```bash
Rscript ../part4-create-colourname-with-colourname-aesthetic-scatterplot-hour.R
```

Here's the part 4 output:<br />
<a data-flickr-embed="true"  href="https://www.flickr.com/photos/roland/35629942613/in/dateposted-ff/" title="part4-colourname-aesthetic-january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour-colourname"><img src="https://farm5.staticflickr.com/4416/35629942613_f1896066a1.jpg" width="500" height="272" alt="part4-colourname-aesthetic-january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour-colourname"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

## July 24, 2017
* 1\. [average-colour-by-hour-ggjoy-from-csv.R not working](https://github.com/rtanglao/2016-r-rtgram/blob/master/average-colour-by-hour-ggjoy-from-csv.R)
```bash
Rscript ../average-colour-by-hour-ggjoy-from-csv.R 31-january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv 
Error in FUN(X[[i]], ...) : need at least 2 data points
Calls: main ... <Anonymous> -> f -> <Anonymous> -> f -> vapply -> FUN
Execution halted
```
* 2\.But I have two data points! namely for example the first 6 rows I have 3 rows with ```indianred4```
```
 colour                             id dayofweek.month.dayofmonth daynumber   unixtime  hour colourname
    <chr>                          <chr>                      <chr>     <int>      <int> <int>      <chr>
1 #546363 1174465369140103047_2176611536                   SunJan31        31 1454227203     0     gray37
2 #ACA8A8 1174465451560169285_2137478482                   SunJan31        31 1454227213     0   darkgray
3 #6B3434 1174465462824925338_2250967365                   SunJan31        31 1454227215     0 indianred4
4 #4B3E3E  1174465565628114803_177763144                   SunJan31        31 1454227227     0     gray26
5 #803A3A  1174465617924150379_361059564                   SunJan31        31 1454227233     0 indianred4
6 #704141 1174465676122308807_1537167607                   SunJan31        31 1454227240     0 indianred4
```

## September 11, 2016

### 24 squares per day
1. ```cd /Users/rtanglao/Dropbox/GIT/2016-r-rtgram/JANUARY2016/24SQUARES-PER-DAY```
2. ```parallel Rscript ../../twenty-four-square-pie-chart-from-csv.R '{}' ::: ../??-january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv```
3. ```mkdir TRIMMED```
1. ```parallel convert -trim '{}' 'TRIMMED/{}' ::: *.png```
1. ```cd TRIMMED```
1. ```ls -1 *.png  >31pngs.txt```
1. ```gm montage -verbose -adjoin -tile 7x6 +frame +shadow +label -adjoin -geometry '1023x684+0+0<' null: null: null: null: null: @31pngs.txt null: null: null: null: null: null: ig-van-2016-one-top-colour-square-per-hour-01-31january2016-square-piechart.png```

### Here's how the 24 squares per day looks!

<a data-flickr-embed="true"  href="https://www.flickr.com/photos/roland/29008995333/in/dateposted-ff/" title="ig-van-2016-one-top-colour-square-per-hour-01-31january2016-square-piechart"><img src="https://c6.staticflickr.com/9/8139/29008995333_1881d310f8.jpg" width="500" height="287" alt="ig-van-2016-one-top-colour-square-per-hour-01-31january2016-square-piechart"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>


### Dataset for January 2016 on octopub

Put the [january 1-31, 2016 github dataset up on octopub](https://rtanglao.github.io/january-1-31-2016-instagram-vancouver-metadata-including-average-colour-hour-day-unixtime/) (which is on github!)

## September 8, 2016
### 24 square plan
1. for each day.csv
    1. loop over all 24 hours (do i really need a loop? probably not)
    1. get that hour's subset from the CSV file, average the subset, add the average to that hour's dataframe
	1. add colourname to the hour's dataframe and the graph the hour's dataframe
	

## September 6, 2016

1. What shall I do next besides the pull request for waffle and/or the github issue?:
    1. Maybe average colour over each day and then do a June 1-May 27, 2016 graphic?
    1. Maybe train a neural network with the likes (weight 0.5), comments (weight 1.0) with my instagram photos from 2014-2016?

## September 5, 2016
### Do 3000 first photos instagram vancouver average colour square pie charts for January 1-31, 2016

1. ```cd /Users/rtanglao/Dropbox/GIT/2016-r-rtgram/JANUARY2016/FIXED-WAFFLE-3000```
1. ```parallel Rscript ../../file-numphotos-square-piechart.R '{}' 3000 ::: ../*-january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv```
1. ```mkdir TRIMMED```
1. ```parallel convert -trim '{}' 'TRIMMED/{}' ::: 3000*.png```
1. ```cd TRIMMED```
1. ```ls -1 3000*.png  >31pngs.txt```
1. ```gm montage -verbose -adjoin -tile 7x6 +frame +shadow +label -adjoin -geometry '1023x308+0+0<' null: null: null: null: null: @31pngs.txt null: null: null: null: null: null: ig-van-2016-top3000-topcolour-sorted-3000-squares-01-31january2016-square-piechart.png```

### waffle() doesn't work if you have more than 25 levels in your square piechart
The solution which I still haven't tested:

From [stack overflow repeating vector of letters](http://stackoverflow.com/questions/21681785/repeating-vector-of-letters):

```R
letters658 = make.unique(rep(letters, length.out = 658), sep='') #use letters658 instead of LETTERS R constant
```

The above code makes up for the R constant ```LETTERS``` only having 26 levels when R has 657 colours (add 1 since
waffle() starts at 'B' instead of 'A'). So having 657 letters will allow all R colours to be plotted safely instead of any colour beyond the 
first 26 being turned into 'not a number' i.e. ```NA```.

## September 1, 2016
### Write a test case for waffle()
pseudo code: pass in number of squares as a command line argument, do (2500-1000)/2 + 1000 i.e. a binary search for where it breaks startg with 1750

## August 31, 2016 

### Cumulative sum 1000
Algorithm: take 1st 2500 photos, get colournames, sort by descending frequency of colournames and then take the first 1000 photos to form a square pie chart graph of <=1000 squares

1. ```/Users/rtanglao/Dropbox/GIT/2016-r-rtgram/JANUARY2016/CUMULATIVE-SUM-1000```
1. ```mkdir TRIMMED```
1.  ```ls -1 ../*-january2016-ig-van-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv | xargs -n 1 Rscript ../../cumulativesum-size0.1-first2500-void-square-piechart-from-csv.R```
1. ```parallel convert -trim '{}' 'TRIMMED/{}' ::: cumulative-sum*.png``` # results in 750x480 and 768x480 png
1. ```cd TRIMMED; ls -1 >31pngs.txt```
1. ```gm montage -verbose -adjoin -tile 7x6 +frame +shadow +label -adjoin -geometry '768x480+0+0<' null: null: null: null: null: @31pngs.txt null: null: null: null: null: null: ig-van-2016-top2500-topcolour-sorted-1000-squares-01-31january2016-square-piechart.png```
1. ```gm montage -verbose -adjoin -tile 7x6 +frame +shadow +label -adjoin -geometry '750x480+0+0<' null: null: null: null: null: @31pngs.txt null: null: null: null: null: null: 750-ig-van-2016-top2500-topcolour-sorted-1000-squares-01-31january2016-square-piechart.png```
<a data-flickr-embed="true"  href="https://www.flickr.com/photos/roland/29341985206/in/dateposted-ff/" title="768-ig-van-2016-top2500-topcolour-sorted-1000-squares-01-31january2016-square-piechart"><img src="https://c7.staticflickr.com/9/8827/29341985206_f7eccf9b09.jpg" width="500" height="268" alt="768-ig-van-2016-top2500-topcolour-sorted-1000-squares-01-31january2016-square-piechart"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

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

