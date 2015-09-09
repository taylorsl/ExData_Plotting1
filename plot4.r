library(dplyr)
library(lubridate)
# Read in file and filter to desired dates
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?")
power$Date <- dmy(power$Date)
filtered <- filter(power, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))

#Create new field which combines Date and Time
filtered <- mutate(filtered,TimeStamp = ymd_hms(paste(Date,Time)))
png(filename="plot4.png")

#Set up multiple plot
par(mfrow=c(2,2))

#Plot 1
plot(filtered$TimeStamp,filtered$Global_active_power,type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
     
#Plot 2
plot(filtered$TimeStamp,filtered$Voltage,type="l", xlab = "datetime", ylab = "Voltage")

#Plot 3
plot(filtered$TimeStamp,filtered$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
lines(filtered$TimeStamp,filtered$Sub_metering_2,col = "red")
lines(filtered$TimeStamp,filtered$Sub_metering_3,col = "blue")
legend(x="topright",bty="n", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,col=c("black","red","blue"))

#Plot 4
plot(filtered$TimeStamp,filtered$Global_reactive_power,type="l", xlab = "datetime", 
     ylab = "global_reactive_power")

dev.off()