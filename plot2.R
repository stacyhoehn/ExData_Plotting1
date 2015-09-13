#read in the data
household_power_consumption <- read.csv("C:/Users/Stacy/household_power_consumption.txt", sep=";", na.strings="?")

#extract the data from February 1, 2007 and February 2, 2007 from the data set
correctDates <- subset(household_power_consumption,Date == "1/2/2007" | Date == "2/2/2007")
attach(correctDates)

#merge the dates and times to create a new variable to plot
mergedDateTime <- as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")

#create the plot of the new date/time variable vs Global_active_power
png("plot2.png",width=480,height=480,units="px")
plot(mergedDateTime,Global_active_power,lwd=1,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

detach(correctDates)
