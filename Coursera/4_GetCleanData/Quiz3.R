install.packages("data.table")
library(data.table)

## download & read data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
f <- file.path(getwd(), "ss06hid.csv")
download.file(url, f, method="curl")
downloadTime <- date()

dt <- data.table(read.csv(f))

agricultureLogical <- dt$ACR == 3 & dt$AGS == 6

result <- which(agricultureLogical)
head(result,3)

## Question 2
install.packages('jpeg')
library(jpeg)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
f <- file.path(getwd(), "jeff.jpg")
download.file(url,f, method="curl")

jpeg <- readJPEG(f,native=TRUE)
quantile(jpeg,c(0.3,0.8))

## Question 3
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
f <- file.path(getwd(), "GDP.csv")
download.file(url, f, method="curl")

dtGDP <- data.table(read.csv(f, skip = 4, nrows = 215))
## dtGDP <- read.csv(f,header=TRUE, sep=",",skip = 4,nrows = 215)
dtGDP <- dtGDP[X != ""]
dtGDP <- dtGDP[, list(X, X.1, X.3, X.4)]
setnames(dtGDP, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", 
                                               "Long.Name", "gdp"))

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
f <- file.path(getwd(), "EDUSTATS_Country.csv")
download.file(url, f, method="curl")
dtEd <- data.table(read.csv(f))

## join 2 tables
dt <- merge(dtGDP,dtEd, all = TRUE, by = "CountryCode")
## remove Null
dt <- dt[!is.na(dt$rankingGDP),]

## sort
ordered <- dt[order(rankingGDP, decreasing = TRUE), list(CountryCode, Long.Name.x, Long.Name.y, 
                                                         rankingGDP, gdp)]
## 13th item
ordered[13]

## Question 4
dt[, mean(rankingGDP, na.rm = TRUE), by = Income.Group]

## Question 5
breaks <- quantile(dt$rankingGDP, probs = seq(0, 1, 0.2), na.rm = TRUE)
dt$quantileGDP <- cut(dt$rankingGDP, breaks = breaks)
dt[Income.Group == "Lower middle income", .N, by = c("Income.Group", "quantileGDP")]