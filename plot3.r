library(dplyr)
library(lubridate)
# Read in file and filter to desired dates
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?")
power$Date <- dmy(power$Date)
filtered <- filter(power, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))

#Create new field which combines Date and Time
filtered <- mutate(filtered,TimeStamp = ymd_hms(paste(Date,Time)))
png(filename="plot3.png")
plot(filtered$TimeStamp,filtered$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
lines(filtered$TimeStamp,filtered$Sub_metering_2,col = "red")
lines(filtered$TimeStamp,filtered$Sub_metering_3,col = "blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()