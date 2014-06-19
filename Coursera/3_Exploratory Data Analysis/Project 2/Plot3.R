library(data.table)
library(ggplot2)

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
plotdata <- data_bmore[,sum(Emissions),by="year,type"]

## plot data
png('Plot3.png')
ggplot(plotdata,aes(x=year, y=V1, fill=type))+
  geom_bar(stat="identity")+
  ##facet_grid(. ~ type) +
  xlab("year")+
  ylab(expression("total PM"[2.5]*" emission")) +
  ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore ",
                                     "City by various source types", sep="")))
dev.off()