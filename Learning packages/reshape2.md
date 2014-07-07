Reshape2
========================================================

`reshape2` is an R package written by Hadley Wickham that makes it easy to transform data between wide and long formats.

## Wide or Long Data
Wide data has a column for each variable. For example, this is wide-format data:

```r
head(airquality)
```

```
##   ozone solar.r wind temp month day
## 1    41     190  7.4   67     5   1
## 2    36     118  8.0   72     5   2
## 3    12     149 12.6   74     5   3
## 4    18     313 11.5   62     5   4
## 5    NA      NA 14.3   56     5   5
## 6    28      NA 14.9   66     5   6
```


And this is long-format data:
```
##    variable  value
## 1     ozone 23.615
## 2     ozone 29.444
## 3     ozone 59.115
## 4     ozone 59.962
## 5      wind 11.623
## 6      wind 10.267
## 7      wind  8.942
## 8      wind  8.794
## 9      temp 65.548
## 10     temp 79.100
## 11     temp 83.903
## 12     temp 83.968
```


Long-format data has a column for possible variable types and a column for the values of those variables. Long-format data isn’t necessarily only two columns. For example, we might have ozone measurements for each day of the year. In that case, we could have another column for day. In other words, there are different levels of “longness”. The ultimate shape you want to get your data into will depend on what you are doing with it.

For example, `ggplot2` requires long-format data (technically tidy data), `plyr` requires long-format data, and most modelling functions (such as `lm()`, `glm()`, and `gam()`) require long-format data. But people often find it easier to record their data in wide format.

## The reshape2 package
reshape2 is based around two key functions: `melt` and `cast`:

- `melt` takes wide-format data and melts it into long-format data.
- `cast` takes long-format data and casts it into wide-format data.

Think of working with metal: if you melt metal, it drips and becomes long. If you cast it into a mould, it becomes wide.


```r
## install.packages("reshape2")
library(reshape2)
```

## Airquality dataset

```r
str(airquality)
```

```
## 'data.frame':	153 obs. of  6 variables:
##  $ ozone  : int  41 36 12 18 NA 28 23 19 8 NA ...
##  $ solar.r: int  190 118 149 313 NA NA 299 99 19 194 ...
##  $ wind   : num  7.4 8 12.6 11.5 14.3 14.9 8.6 13.8 20.1 8.6 ...
##  $ temp   : int  67 72 74 62 56 66 65 59 61 69 ...
##  $ month  : int  5 5 5 5 5 5 5 5 5 5 ...
##  $ day    : int  1 2 3 4 5 6 7 8 9 10 ...
```

```r
names(airquality) <- tolower(names(airquality))
head(airquality)
```

```
##   ozone solar.r wind temp month day
## 1    41     190  7.4   67     5   1
## 2    36     118  8.0   72     5   2
## 3    12     149 12.6   74     5   3
## 4    18     313 11.5   62     5   4
## 5    NA      NA 14.3   56     5   5
## 6    28      NA 14.9   66     5   6
```

## `melt`:
Wide to long

```r
aql <- melt(airquality)
```

```
## No id variables; using all as measure variables
```

```r
head(aql)
```

```
##   variable value
## 1    ozone    41
## 2    ozone    36
## 3    ozone    12
## 4    ozone    18
## 5    ozone    NA
## 6    ozone    28
```


ID variables are the variables that identify individual rows of data.

```r
aql <- melt(airquality, id.vars = c("month", "day"))
head(aql)
```

```
##   month day variable value
## 1     5   1    ozone    41
## 2     5   2    ozone    36
## 3     5   3    ozone    12
## 4     5   4    ozone    18
## 5     5   5    ozone    NA
## 6     5   6    ozone    28
```

Control the column names in our long-format data

```r
aql <- melt(airquality, id.vars = c("month", "day"),
            variable.name = "climate_variable", 
            value.name = "climate_value")
head(aql)
```

```
##   month day climate_variable climate_value
## 1     5   1            ozone            41
## 2     5   2            ozone            36
## 3     5   3            ozone            12
## 4     5   4            ozone            18
## 5     5   5            ozone            NA
## 6     5   6            ozone            28
```

## `cast`:
Long to wide

In reshape2 there are multiple cast functions. Since you will most commonly work with `data.frame` objects, we’ll explore the `dcast` function. (There is also `acast` to return a vector, matrix, or array.)


```r
aql <- melt(airquality, id.vars = c("month", "day"))
aqw <- dcast(aql, month + day ~ variable)
head(aqw)
```

```
##   month day ozone solar.r wind temp
## 1     5   1    41     190  7.4   67
## 2     5   2    36     118  8.0   72
## 3     5   3    12     149 12.6   74
## 4     5   4    18     313 11.5   62
## 5     5   5    NA      NA 14.3   56
## 6     5   6    28      NA 14.9   66
```

```r
head(airquality) # original data
```

```
##   ozone solar.r wind temp month day
## 1    41     190  7.4   67     5   1
## 2    36     118  8.0   72     5   2
## 3    12     149 12.6   74     5   3
## 4    18     313 11.5   62     5   4
## 5    NA      NA 14.3   56     5   5
## 6    28      NA 14.9   66     5   6
```

note: Here, we need to tell dcast that month and day are the ID variables (we want a column for each) and that variable describes the measured variables. Since there is only one remaining column, dcast will figure out that it contains the values themselves. We could explicitly declare this with value.var. (And in some cases it will be necessary to do so.)


When you cast your data and there are multiple values per cell, you also need to tell dcast how to aggregate the data. For example, maybe you want to take the mean, or the median, or the sum. Let’s try the last example, but this time we’ll take the mean of the climate values. We’ll also pass the option na.rm = TRUE through the ... argument to remove NA values. (The ... let’s you pass on additional arguments to your fun.aggregate function, here mean.)

```r
dcast(aql, month ~ variable, fun.aggregate = mean, na.rm = TRUE)
```

```
##   month ozone solar.r   wind  temp
## 1     5 23.62   181.3 11.623 65.55
## 2     6 29.44   190.2 10.267 79.10
## 3     7 59.12   216.5  8.942 83.90
## 4     8 59.96   171.9  8.794 83.97
## 5     9 31.45   167.4 10.180 76.90
```

