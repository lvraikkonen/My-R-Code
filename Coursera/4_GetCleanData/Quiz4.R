library(data.table)

################Question 1##############################

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

## Read table
dt <- data.table(read.csv(f))

## Variable names
varNames <- names(dt)
## Split names
varSplitNames <- strsplit(varNames,'wgtp')
## Result
varSplitNames[[123]]


################Question 2##############################
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
f <- file.path(getwd(), "FGDP.csv")
download.file(url, f)
dataDownloaded <- date()

dtGDP <- data.table(read.csv(f, skip = 4, nrows = 215, stringsAsFactors = FALSE))
dtGDP <- dtGDP[X != ""]
dtGDP <- dtGDP[, list(X, X.1, X.3, X.4)]
setnames(dtGDP, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", 
                                               "Long.Name", "gdp"))
## Remove comma in dollars
gdp <- as.numeric(gsub(",", "", dtGDP$gdp))
mean(gdp,na.rm = TRUE)

## remove invalid gdp values
## newGDP <- dtGDP[]



################Question 3##############################
countries <- grepl("^United",dtGDP$Long.Name)
summary(countries)


################Question 4##############################
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
f <- file.path(getwd(), "EDSTATS_Country.csv")
download.file(url, f)
dtEd <- data.table(read.csv(f))
dt <- merge(dtGDP, dtEd, all = TRUE, by = c("CountryCode"))
isFiscalYearEnd <- grepl("fiscal year end", tolower(dt$Special.Notes))
isJune <- grepl("june", tolower(dt$Special.Notes))
table(isFiscalYearEnd,isJune)


################Question 5##############################
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
## How many values were collected in 2012
table(year(sampleTimes))
## How many values were collected on Mondays in 2012
table(year(sampleTimes), weekdays(sampleTimes))