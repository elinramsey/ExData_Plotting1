setwd("~/Documents/CourseraDS_Git/explore1")
power = read.csv("household_power_consumption.txt",sep=";")
puse <- power[(power$Date == "1/2/2007") | (power$Date == "2/2/2007"),]
p1 <- as.numeric(levels(puse$Global_active_power))[puse$Global_active_power]
hist(p1, col = "red", main = "Global Active Power",xlab = "Global Active Power (Kilowatts)")