library(tidyverse)

household_power_consumption <- read_csv2("Exploratory Data Analysis/household_power_consumption.txt", na = "?")

household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")
household_power_consumption$Time <- format(household_power_consumption$Time, format="%H:%M:%S")
household_power_consumption$Global_active_power <- as.numeric(household_power_consumption$Global_active_power)
household_power_consumption$TimeDate <- NA
household_power_consumption$TimeDate <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

subset_power <- subset(household_power_consumption, Date == "2007-02-01" | Date =="2007-02-02")

png("plot2.png", width=480, height=480)
with(subset_power, plot(TimeDate, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()
