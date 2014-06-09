## plot 1
source("import_data.R")
filename <- "./Data/household_power_consumption.txt"

data <- load_data(filename)

png("plot1.png", width=400, height=400)
        
hist(data$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")
        
<<<<<<< HEAD
dev.off()
=======
dev.off()
>>>>>>> eca5b295515355b938949e3bee4266724f35a8e6
