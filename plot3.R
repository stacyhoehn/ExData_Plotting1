#read in the data
household_power_consumption <- read.csv("C:/Users/Stacy/household_power_consumption.txt", sep=";", na.strings="?")

#extract the data from February 1, 2007 and February 2, 2007 from the data set
correctDates <- subset(household_power_consumption,Date == "1/2/2007" | Date == "2/2/2007")
attach(correctDates)

#merge the dates and times to create a new variable to plot
mergedDateTime <- as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")

#create the desired plot of date/time vs sub_metering values
png("plot3.png",width=480,height=480,units="px")
plot(mergedDateTime,Sub_metering_1,col="black",pch=0,type="l",xlab="",ylab="Energy sub metering")
lines(mergedDateTime,Sub_metering_2,col="red")
lines(mergedDateTime,Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),lty=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.8)
dev.off()

detach(correctDates)
