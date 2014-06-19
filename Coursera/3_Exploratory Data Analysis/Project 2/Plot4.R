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

## Choose coal related SCC
SCC.isCoal <- grepl("coal", SCC$Short.Name, ignore.case=TRUE)
SCC.coal <- SCC[SCC.isCoal,]

## join two tables
merged <- merge(data, SCC.coal, by="SCC")

## Aggregate data
plotdata <- merged[,sum(Emissions),by="year"]
plotdata$V1 <- round(plotdata$V1/1000,2)

##plot 4
png("Plot4.png")
ggplot(plotdata, aes(x=year, y=V1)) +
  geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression(paste('PM', ''[2.5], ' in Kilotons'))) +
  ggtitle("Emissions from coal combustion-related sources")
dev.off()