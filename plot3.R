#reading data for two days, reading variable names and adding the names to dataset

Householddata <- read.table("C:/Users/shubhayush/Documents/coursera/household_power_consumption.txt",
                            sep=";",nrows = 2880,skip= 66637,stringsAsFactors = FALSE)

varname <- as.character(read.table("C:/Users/shubhayush/Documents/coursera/household_power_consumption.txt",
                                   sep=";",nrows = 1,stringsAsFactors = FALSE))
colnames(Householddata)<- varname

# combining date and time, and converting to a Date field 
library(lubridate)
dates <- Householddata$Date
time  <- Householddata$Time 
datetime <- paste(dates,time)
Date <- dmy_hms(datetime)
Householddata$Date <- Date
Householddata$Time <- NULL

# plot into png file
png(filename = "plot3.png")
plot(Householddata$Date,Householddata$Sub_metering_1,type="l", xlab = "", ylab = "Energy sub metering")
points(Householddata$Date,Householddata$Sub_metering_2,type = "l",col="red")
points(Householddata$Date,Householddata$Sub_metering_3,type = "l",col="blue")
legend("topright",pch = c("_","_","_"),col=c("black","red","blue"),legend = c("Sub_metering_1", 
"Sub_metering_2","Sub_metering_3")  )
dev.off()





