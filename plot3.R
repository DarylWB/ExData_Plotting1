data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Date<-as.Date(data$Date,"%d/%m/%Y")
dataSub<-subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
dataSub$DateTime<-strptime(paste(dataSub$Date , dataSub$Time), "%Y-%m-%d  %H:%M:%S")

with(dataSub, plot(DateTime , as.numeric(as.character(Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering"))
with(dataSub, points(DateTime , as.numeric(as.character(Sub_metering_2)),type="l", col="red"))
with(dataSub, points(DateTime , as.numeric(as.character(Sub_metering_3)),type="l",col="blue"))

legend("topright", col = c("black", "red", "blue"),lty=c(1,1,1), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , cex=0.8)

dev.print(png, file = "plot3.png", width = 480, height = 480) 
dev.off()
