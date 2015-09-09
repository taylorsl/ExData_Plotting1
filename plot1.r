library(dplyr)
library(lubridate)
#Read in file and filter by the dates
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?")
power$Date <- dmy(power$Date)
filtered <- filter(power, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))
#Open PNG file and plot histogram
png(filename="plot1.png")
hist(filtered$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()
