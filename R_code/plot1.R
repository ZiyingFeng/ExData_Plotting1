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

# Plot 1
png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(as.numeric(data2$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

axis(2, at = seq(0, 1200, by = 200), labels = seq(0, 1200, by = 200))

dev.off()