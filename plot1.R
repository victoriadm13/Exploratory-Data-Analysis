## Installing Packages

install.packages("dplyr")
library(dplyr)
install.packages("data.table")
library(data.table)

## Reading and subseting the data

data <- fread("household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE)
data_sub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## Plot 1

GAP <- as.numeric(data_sub$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(GAP, col = "red", main = "Global Active Power" , xlab = "Global Active Power (kilowatts)")
dev.off()

