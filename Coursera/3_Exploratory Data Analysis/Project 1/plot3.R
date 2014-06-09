## plot 3
source("import_data.R")
filename <- "./Data/household_power_consumption.txt"

data <- load_data(filename)

png("plot3.png", width=400, height=400)

plot(data$Time, data$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, col="red") ##add line
lines(data$Time, data$Sub_metering_3, col="blue") ##add line
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1,
       box.lwd=0)

<<<<<<< HEAD
dev.off()
=======
dev.off()
>>>>>>> eca5b295515355b938949e3bee4266724f35a8e6
