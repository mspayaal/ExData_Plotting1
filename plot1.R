#reading data for two days, reading variable names and adding the names to dataset
Householddata <- read.table("C:/Users/shubhayush/Documents/coursera/household_power_consumption.txt",
                            sep=";",nrows = 2880,skip= 66637,stringsAsFactors = FALSE)

varname <- as.character(read.table("C:/Users/shubhayush/Documents/coursera/household_power_consumption.txt",
                      sep=";",nrows = 1,stringsAsFactors = FALSE))
colnames(Householddata)<- varname

 # plot into png file
png(filename =  "plot1.png")
hist(Householddata$Global_active_power,col="red",main = "Global Active Power",xlab="Global Active Power(Kilowatts)")
dev.off()
     



