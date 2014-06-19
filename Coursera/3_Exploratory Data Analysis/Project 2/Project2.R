library(data.table)

dir()

## Read rds data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
data <- transform(NEI,year=factor(NEI$year))

## convert to data.table
data <- data.table(data)

## Aggragate data
plotdata <- data[,sum(Emissions),by=year]
plotdata$V1 <- round(plotdata$V1/1000,2)

## plot data
png('Plot1.png')
barplot(plotdata$V1,names.arg=plotdata$year,
        xlab="years", ylab=expression(paste('PM', ''[2.5], ' in Kilotons')),
        main=expression('Total PM'[2]*' emissions at various years'))
dev.off()