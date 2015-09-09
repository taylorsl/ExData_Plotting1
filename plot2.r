library(dplyr)
library(lubridate)
# Read in file and filter to desired dates
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?")
power$Date <- dmy(power$Date)
filtered <- filter(power, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))

#Create new field which combines Date and Time
filtered <- mutate(filtered,TimeStamp = ymd_hms(paste(Date,Time)))
png(filename="plot2.png")
plot(filtered$TimeStamp,filtered$Global_active_power,type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()