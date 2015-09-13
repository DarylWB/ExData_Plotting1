data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Date<-as.Date(data$Date,"%d/%m/%Y")
dataSub<-subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
dataSub$DateTime<-strptime(paste(dataSub$Date , dataSub$Time), "%Y-%m-%d  %H:%M:%S")

with(dataSub, plot(DateTime , as.numeric(as.character(Global_active_power)), type="l", xlab="", ylab="Global Active Power (kilowatts)"))


dev.print(png, file = "plot2.png", width = 480, height = 480) 
dev.off()
