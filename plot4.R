#Load dataset
mydata<- read.table("household_power_consumption.txt",sep = ";",header = TRUE, na.strings = "?" )
# Filter Feb 1 and 2 ,2017 data
dataFeb<- mydata[which(mydata$Date== ("2/2/2007")|mydata$Date== ("1/2/2007")),]
dataFeb$DateTime<- strptime(paste(dataFeb$Date,dataFeb$Time),"%d/%m/%Y %H:%M:%S")

# Plot the data
par(mfrow=c(2,2),mar=c(5,4,2,1))
#first plot
with(dataFeb,plot(DateTime ,Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)"))

#second plot
with(dataFeb,plot(DateTime ,Voltage,type = "l",xlab = "datetime",ylab = "Voltage"))

#third plot
with(dataFeb,plot(DateTime ,Sub_metering_1,type = "n",xlab = "",ylab = "Energy Sub Metering"))
with(dataFeb,lines(DateTime ,Sub_metering_1))
with(dataFeb,lines(DateTime ,Sub_metering_2,col="red"))
with(dataFeb,lines(DateTime ,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=1, col=c("black","red","blue"),pt.cex =1 ,cex=.60,bty="n")

#fourth plot
with(dataFeb,plot(DateTime ,Global_reactive_power,type = "l",xlab = "datetime",ylab = "Gobal_reactive_power"))

#Copy plot to PNG file and close png graphics device
dev.copy(png,file= "plot4.png",height= 480, width=480)
dev.off()
