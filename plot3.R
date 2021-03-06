## plot 3
# Reading, naming and subsetting power consumption data
p3 <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(p3) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subp3 <- subset(p3,p3$Date=="1/2/2007" | p3$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subp3$Date <- as.Date(subp3$Date, format="%d/%m/%Y")
subp3$Time <- strptime(subp3$Time, format="%H:%M:%S")
subp3[1:1440,"Time"] <- format(subp3[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subp3[1441:2880,"Time"] <- format(subp3[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# calling the basic plot functions
plot(subp3$Time,subp3$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subp3,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subp3,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subp3,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# annotating graph
title(main="Energy sub-metering")