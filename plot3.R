#SET WORKING DIRECTORY
setwd("/Users/adityadas/Downloads/ExData_Plotting1")

#READ AND STORE DATA 
txt <- file("household_power_consumption.txt")
dataset <- read.table(text = grep("^[1,2]/2/2007", readLines(txt), value = TRUE), sep = ";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = "?")

#CONVERT DATE AND TIME TO CLASSES
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")
dataset$DateTime <- as.POSIXct(paste(dataset$Date, dataset$Time))

#GENERATE PLOT
par(mfrow = c(1, 1))
plot(dataset$DateTime, dataset$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(dataset$DateTime, dataset$Sub_metering_2, col = "red")
lines(dataset$DateTime, dataset$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

##SAVE FILE
dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()