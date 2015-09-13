#read in the data
household_power_consumption <- read.csv("C:/Users/Stacy/household_power_consumption.txt", sep=";", na.strings="?")

#extract the data from February 1, 2007 and February 2, 2007 from the data set
correctDates <- subset(household_power_consumption,Date == "1/2/2007" | Date == "2/2/2007")
attach(correctDates)

#create the desired histogram of Global_active_power
png("plot1.png",width=480,height=480,units="px")
hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()

detach(correctDates)