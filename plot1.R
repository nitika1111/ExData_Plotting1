#downloading the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile ="datfile.zip")
unzip("datfile.zip",exdir=".")

#Load dataset
mydata<- read.table("household_power_consumption.txt",sep = ";",header = TRUE, na.strings = "?" )

# Filter Feb 1 and 2 ,2017 data
dataFeb<- mydata[which(mydata$Date== ("2/2/2007")|mydata$Date== ("1/2/2007")),]

# Plot the data
with(dataFeb,hist(Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab="Frequeny"))

#Copy plot to PNG file and close png graphics device
dev.copy(png,file="Plot 1.png",width=480,height=480)
dev.off()
