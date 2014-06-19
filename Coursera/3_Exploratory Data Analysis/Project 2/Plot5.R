library(data.table)
library(ggplot2)

dir()

## Read rds data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
data <- transform(NEI,year=factor(NEI$year))

## convert to data.table
data <- data.table(data)
SCC <- data.table(SCC)

## Baltimore City motor vehicles
data_bmore <- data[data$fips=="24510" & data$type=="ON-ROAD"]

## Aggregate data
plotdata <- data_bmore[,sum(Emissions),by="year"]
## plotdata$V1 <- round(plotdata$V1/1000,2)

## Plot 5
png("Plot5.png")
ggplot(plotdata,aes(x=year, y=V1)) +
  geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emission")) +
  ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore ",
                                     "City from motor vehicle", sep="")))
dev.off()