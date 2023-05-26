# Load the data
data <- read.table("household_power_consumption.txt", header = T, stringsAsFactors = F,
                   na.strings = "?", sep = ';', quote = "", skip = 66636, nrows = 2880, 
                   col.names = c("Date", "Time", "Global_active_power", 
                                 "Global_reactive_power", "Voltage", "Global_intensity", 
                                 "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Convert the Date and Time variables to Date/Time classes
data$DateTime <- with(data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

# Plot 2
png("plot2.png", width = 480, height = 480)
plot(x = data$DateTime, 
     y = data$Global_active_power, 
     type = "l", 
     xlab = NA, 
     ylab = "Global Active Power (kilowatts)")
dev.off()