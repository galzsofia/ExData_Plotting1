library(tidyverse)

household_power_consumption <- read_csv2("Exploratory Data Analysis/household_power_consumption.txt", na = "?")

household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")
household_power_consumption$Time <- format(household_power_consumption$Time, format="%H:%M:%S")
household_power_consumption$Global_active_power <- as.numeric(household_power_consumption$Global_active_power)

subset_power <- subset(household_power_consumption, Date == "2007-02-01" | Date =="2007-02-02")

png("plot1.png", width=480, height=480)
hist(subset_power$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()