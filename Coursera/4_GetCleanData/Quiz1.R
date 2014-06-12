## load packages
library("data.table")
library("xlsx")
library("XML")

## Download dict file
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"
f <- file.path(getwd(), "PUMSDataDict06.pdf")
download.file(url, f, mode = "wb")
dataDownloaded <- date()

## Download data file
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
f <- file.path(getwd(), "ss06hid.csv")
download.file(url, f)
dataDownloaded <- date()

## method 1
dt <- read.csv('ss06hid.csv')
## VAL=24 : $1000000+
housingDt <- dt[dt$VAL==24,]
##remove NAs
housingDt <- housingDt[!is.na(housingDt$VAL),]
nrow(housingDt)

##OR use data.table
dt <- data.table(read.csv(f))
setkey(dt, VAL)
dt[, .N, key(dt)]


## 3 NGAP.xlsx
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
f <- file.path(getwd(), "gov_NGAP.xlsx")
download.file(url, f)
dataDownloaded <- date()

## load row from 18-23 columns 7-15 from xlsx
rows <- 18:23
cols <- 7:15
dat <- read.xlsx(file=f,sheetIndex=1,
                 rowIndex=rows,colIndex=cols)
sum(dat$Zip*dat$Ext,na.rm=TRUE)


## 4 xml
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlInternalTreeParse(url)
rootNode <- xmlRoot(doc)
names(rootNode)

names(rootNode[[1]][[1]])
zipcode <- xpathSApply(rootNode, "//zipcode", xmlValue)

table(zipcode==21231)


## 5
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
f <- file.path(getwd(), "ss06pid.csv")
download.file(url, f)

DT <- fread(f)

check <- function(y, t) {
        message(sprintf("Elapsed time: %.10f", t[3]))
        print(y)
}
t <- system.time(y <- sapply(split(DT$pwgtp15, DT$SEX), mean))
check(y, t)

t1 <- system.time(y <- DT[,mean(pwgtp15),by=SEX])
check(y, t1)