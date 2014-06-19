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

## Baltimore City & Los Angeles  motor vehicles
data_bmore <- data[data$fips=="24510" & data$type=="ON-ROAD"]
data_LA <- data[data$fips=="06037" & data$type=="ON-ROAD"]

data_bmore$Country <- "Baltimore City, MD"
data_LA$Country <- "Los Angeles County, CA"

## Merge data by row
merged <- rbind(data_bmore,data_LA)

## Aggregate data
plotdata <- merged[,sum(Emissions),by="year,Country"]
## plotdata$V1 <- round(plotdata$V1/1000,2)

## Plot 5
png("Plot6.png")
ggplot(data=plotdata, aes(x=year, y=V1)) +
  geom_bar(aes(fill=year),stat="identity") + guides(fill=F) + 
  ggtitle('Total Emissions of Motor Vehicle Sources\nLos Angeles County, California vs. Baltimore City, Maryland') + 
  xlab('Year') +
  ylab(expression('PM'[2.5]))  +
  theme(legend.position='none') + facet_grid(. ~ Country) + 
  geom_text(aes(label=round(V1,0), size=1, hjust=0.5, vjust=-1))

dev.off()