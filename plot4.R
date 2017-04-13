
data<-read.csv("household_power_consumption.txt",sep=";")
data2<-subset(data,as.Date(strptime(data$Date,"%d/%m/%Y"))=="2007-02-01" |as.Date(strptime(data$Date,"%d/%m/%Y"))=="2007-02-02")
Sys.setlocale("LC_TIME","English")
data2$X<-as.POSIXct(strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S"))
png("plot4.png",width = 480,height = 480)

par(mfrow=c(2,2))

with(data2,{
  with(data2,plot(X,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
  with(data2,plot(X,Voltage,type="l",ylab="Voltage",xlab="datetime"))
  {with(data2,plot(X,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black"))
    with(data2,lines(X,Sub_metering_2,type="l",col="red"))
    with(data2,lines(X,Sub_metering_3,type="l",col="blue"))
    legend("topright", pch = "-", col = c("black","red", "blue"),bty="n",cex=0.5,seg.len=5,lwd=3, legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))}
  with(data2,plot(X,Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime"))
})


dev.off()