library(tidyverse)

household_power_consumption <- read_csv2("Exploratory Data Analysis/household_power_consumption.txt", na = "?")

household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")
household_power_consumption$Time <- format(household_power_consumption$Time, format="%H:%M:%S")
household_power_consumption$Global_active_power <- as.numeric(household_power_consumption$Global_active_power)
household_power_consumption$TimeDate <- NA
household_power_consumption$TimeDate <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

subset_power <- subset(household_power_consumption, Date == "2007-02-01" | Date =="2007-02-02")

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(subset_power, plot(TimeDate, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(subset_power, plot(TimeDate, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
with(subset_power, plot(TimeDate, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(subset_power$TimeDate, subset_power$Sub_metering_2,type="l", col= "red")
lines(subset_power$TimeDate, subset_power$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
with(subset_power, plot(TimeDate, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()