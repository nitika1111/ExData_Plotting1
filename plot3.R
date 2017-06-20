#Load dataset
mydata<- read.table("household_power_consumption.txt",sep = ";",header = TRUE, na.strings = "?" )
# Filter Feb 1 and 2 ,2017 data
dataFeb<- mydata[which(mydata$Date== ("2/2/2007")|mydata$Date== ("1/2/2007")),]
dataFeb$DateTime<- strptime(paste(dataFeb$Date,dataFeb$Time),"%d/%m/%Y %H:%M:%S")

# Plot the data
with(dataFeb,plot(DateTime ,Sub_metering_1,type = "n",xlab = "",ylab = "Energy Sub Metering"))
with(dataFeb,lines(DateTime ,Sub_metering_1))
with(dataFeb,lines(DateTime ,Sub_metering_2,col="red"))
with(dataFeb,lines(DateTime ,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2, col=c("black","red","blue"))

#Copy plot to PNG file and close png graphics device
dev.copy(png,file= "plot3.png",height= 480, width=480)
dev.off()
