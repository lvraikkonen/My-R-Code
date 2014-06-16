## Try to Use data.table package
========================================================

### Setup
You must load the package `data.table` first
```r
library(data.table)
```

### Creation
Like create `data.frame()`
```r
DT <- data.table(x=c("a","a","a","b","b"),value=rnorm(5))
```

Convert data frame objects to data table object
```r
## convert
CARS <- data.table(cars)
```

See a list of data.tables in memory
```r
tables()
```
```
NAME NROW MB COLS       KEY
[1,] CARS   50 1  speed,dist    
[2,] DT      6 1  x,value       
Total: 2MB
```

## Keys
