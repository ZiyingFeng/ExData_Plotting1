# Read the raw data
data <- read.table("./household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE)

# Convert the first column to date
data[,1] <- as.Date(data[,1], format = "%d/%m/%Y")

# Extract data from the dates 2007-02-01 and 2007-02-02
data1 <- subset(data, data[,1]>="2007-02-01" & data[,1]<="2007-02-02")
# Or using data1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Remove missing data
data2 <- data1[!grepl("\\?", data1[,2]),]

# Convert the first two columns to date
data3 <- data2
data3$DateTime <- ymd(data3[,1])+hms(data3[,2])
# Or using datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
