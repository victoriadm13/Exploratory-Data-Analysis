## Reading and subseting the data

data <- fread("household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE)
data_sub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## Change format

DT <- strptime(paste(data_sub$Date, data_sub$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(data_sub$Global_active_power)
SM1 <- as.numeric(data_sub$Sub_metering_1)
SM2 <- as.numeric(data_sub$Sub_metering_2)
SM3 <- as.numeric(data_sub$Sub_metering_3)
VOL <- as.numeric(data_sub$Voltage)
GRP <- as.numeric(data_sub$Global_reactive_power)

## Plot 4

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(DT, GAP, type = "l" , xlab = " ", ylab = "Global Active Power")

plot(DT, VOL , type = "l" , xlab = "datetime", ylab = "Voltage" )

plot(DT, SM1, type = "l" ,  xlab = " ", ylab = "Energy sub metering")
lines(DT, SM2, type = "l", col = "red")
lines(DT, SM3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black" , "red" , "blue") , lty = 1, lwd = 2.5)

plot(DT, GRP, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()


