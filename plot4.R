# Load the data
data <- read.table("household_power_consumption.txt", header = T, stringsAsFactors = F,
                   na.strings = "?", sep = ';', quote = "", skip = 66636, nrows = 2880, 
                   col.names = c("Date", "Time", "Global_active_power", 
                                 "Global_reactive_power", "Voltage", "Global_intensity", 
                                 "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Convert the Date and Time variables to Date/Time classes
data$DateTime <- with(data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

# Plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) 

#Top left
plot(x = data$DateTime, 
     y = data$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power")

#Top right
plot(x = data$DateTime, 
     y = data$Voltage, 
     type = 'l', 
     xlab = 'datetime', 
     ylab = 'Voltage')

#Bottom left
plot(x = data$DateTime, 
     y = data$Sub_metering_1, 
     type = "l",
     xlab = "", 
     ylab = "Energy sub metering")
lines(x = data$DateTime, 
      y = data$Sub_metering_2, 
      col = 'red')
lines(x = data$DateTime, 
      y = data$Sub_metering_3, 
      col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), 
       lty = 1, 
       lwd = 1, 
       bty = "n")

#Bottom right
plot(x = data$DateTime, 
     y = data$Global_reactive_power, 
     type = 'l',
     xlab = 'datetime', 
     ylab = 'Global_reactive_power')

dev.off()