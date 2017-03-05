##plot 2
# Reading, naming and subsetting power consumption data
p2 <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(p2) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subp2 <- subset(p2,p2$Date=="1/2/2007" | p2$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subp2$Date <- as.Date(subp2$Date, format="%d/%m/%Y")
subp2$Time <- strptime(subp2$Time, format="%H:%M:%S")
subp2[1:1440,"Time"] <- format(subp2[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subp2[1441:2880,"Time"] <- format(subp2[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# calling the basic plot function
plot(subp2$Time,as.numeric(as.character(subp2$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# annotating graph
title(main="Global Active Power Vs Time")
