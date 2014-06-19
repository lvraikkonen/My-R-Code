library(data.table)

dir()

## Read rds data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
data <- transform(NEI,year=factor(NEI$year))

## convert to data.table
data <- data.table(data)

## Baltimore City
data_bmore <- data[data$fips=="24510"]

## Aggragate data
plotdata <- data_bmore[,sum(Emissions),by=year]
## plotdata$V1 <- round(plotdata$V1/1000,2)

## plot data
png('Plot2.png')
barplot(plotdata$V1,names.arg=plotdata$year,
        xlab="years", ylab=expression('total PM'[2]*' emission'),
        main=expression('Total PM'[2]*' emissions in Baltimore City, '*
            'Maryland at various years'))
dev.off()