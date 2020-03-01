
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

png(filename =  "plot2.png")
plot(Householddata$Date,Householddata$Global_active_power,type="l", xlab = "", ylab = "Active Global Power (kilowatts)",
     main ="Global Active Power")
dev.off()





