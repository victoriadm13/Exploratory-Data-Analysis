## Reading and subseting the data

data <- fread("household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE)
data_sub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## Change format

DT <- strptime(paste(data_sub$Date, data_sub$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(data_sub$Global_active_power)
SM1 <- as.numeric(data_sub$Sub_metering_1)
SM2 <- as.numeric(data_sub$Sub_metering_2)
SM3 <- as.numeric(data_sub$Sub_metering_3)

## Plot 3

png("plot3.png", width = 480, height = 480)
plot(DT, SM1, type = "l" , xlab = " ", ylab = "Energy sub metering")
lines(DT, SM2, type = "l", col = "red")
lines(DT, SM3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black" , "red" , "blue") , lty = 1, lwd = 2.5)
dev.off()


