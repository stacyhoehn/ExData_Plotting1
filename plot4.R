#read in the data
household_power_consumption <- read.csv("C:/Users/Stacy/household_power_consumption.txt", sep=";", na.strings="?")

#extract the data from February 1, 2007 and February 2, 2007 from the data set
correctDates <- subset(household_power_consumption,Date == "1/2/2007" | Date == "2/2/2007")
attach(correctDates)

#merge the dates and times to create a new variable to plot
mergedDateTime <- as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")

#create a 2x2 plot of desired plots
png("plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2))

#plot 1
plot(mergedDateTime,Global_active_power,lwd=1,type="l",xlab="",ylab="Global Active Power")
#plot 2
plot(mergedDateTime,Voltage,lwd=1,pch=0,type="l",xlab="datetime",ylab="Voltage")
#plot 3
plot(mergedDateTime,Sub_metering_1,col="black",pch=0,type="l",xlab="",ylab="Energy sub metering")
lines(mergedDateTime,Sub_metering_2,col="red")
lines(mergedDateTime,Sub_metering_3,col="blue")
legend("topright",bty = "n",col=c("black","red","blue"),lty=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.8)
#plot 4
plot(mergedDateTime,Global_reactive_power,lwd=0.5,pch=0,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()

detach(correctDates)
