#Load dataset
mydata<- read.table("household_power_consumption.txt",sep = ";",header = TRUE, na.strings = "?" )
# Filter Feb 1 and 2 ,2017 data
dataFeb<- mydata[which(mydata$Date== ("2/2/2007")|mydata$Date== ("1/2/2007")),]
dataFeb$DateTime<- strptime(paste(dataFeb$Date,dataFeb$Time),"%d/%m/%Y %H:%M:%S")

# Plot the data
with(dataFeb,plot(DateTime ,Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)"))

#Copy plot to PNG file and close png graphics device
dev.copy(png,file= "plot2.png",height= 480, width=480)
dev.off()
