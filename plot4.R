setwd("~/Documents/CourseraDS_Git/explore1")
power = read.csv("household_power_consumption.txt",sep=";")
puse <- power[(power$Date == "1/2/2007") | (power$Date == "2/2/2007"),]
p1 <- as.numeric(levels(puse$Global_active_power))[puse$Global_active_power]
p2 <- as.numeric(levels(puse$Voltage))[puse$Voltage]
p3 <- as.numeric(levels(puse$Global_reactive_power))[puse$Global_reactive_power]

puse$timestamp <- within(puse, { timestamp=format(as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S") })

par(mfrow = c(2,2))

with(puse, {
  plot.ts(p1,xlab ="", ylab = "Global Active Power")
  plot.ts(p2,xlab = "datetime",ylab="Voltage")
  
  plot.ts(puse$Sub_metering_1,xlab="",ylab="Energy sub metering")
  lines(puse$Sub_metering_2,col = "red")
  lines(puse$Sub_metering_3,col = "blue")
  legend("topright",col = c("Black","Red","Blue"),legen = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(2.5,2.5),
         bty = "n")
  plot.ts(p3,xlab = "datetime",ylab="Global_reactive_power")
  
})
