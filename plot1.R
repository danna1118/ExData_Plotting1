## plot 1
#Reading, naming and subsetting power consumption data
p1 <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(p1) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subp1<- subset(p1,p1$Date=="1/2/2007" | p1$Date =="2/2/2007")

#calling the basic plot function
hist(as.numeric(as.character(subp1$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# annotating graph
title(main="Global Active Power")
