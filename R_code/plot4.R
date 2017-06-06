# Read the raw data
data <- read.table("./household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE)

# Convert the first column to date
data[,1] <- as.Date(data[,1], format = "%d/%m/%Y")

# Extract data from the dates 2007-02-01 and 2007-02-02
data1 <- subset(data, data[,1]>="2007-02-01" & data[,1]<="2007-02-02")

# Remove missing data
data2 <- data1[!grepl("\\?", data1[,2]),]

# Convert the first two columns to date
data3 <- data2
data3$DateTime <- ymd(data3[,1])+hms(data3[,2])

# Plot 4
png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow=c(2,2), mar=c(4,4,2,1))

plot(data3$DateTime, as.numeric(data3$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power")

plot(data3$DateTime, data3$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(data3$DateTime, data3$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

points(data3$DateTime, data3$Sub_metering_2, type = "l", col = "red")

points(data3$DateTime, data3$Sub_metering_3, type = "l", col = "blue")

# Or using lines(datetime, subMetering2, type="l", col="red")

legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.5, y.intersp = 0.5)

plot(data3$DateTime, data3$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
