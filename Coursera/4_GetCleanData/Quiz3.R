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

dtGDP <- read.csv(f,header=TRUE, sep=",",skip = 5,nrows = 195)
##dtGDP <- read.xls?

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
f <- file.path(getwd(), "EDUSTATS_Country.csv")
download.file(url, f, method="curl")
dtEd <- data.table(read.csv(f))