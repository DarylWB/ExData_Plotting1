data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Date<-as.Date(data$Date,"%d/%m/%Y")
dataSub<-subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
dataSub$DateTime<-strptime(paste(dataSub$Date , dataSub$Time), "%Y-%m-%d  %H:%M:%S")

hist(as.numeric(as.character(dataSub$Global_active_power)),main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

dev.print(png, file = "plot1.png", width = 480, height = 480) 
dev.off()
