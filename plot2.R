
data<-read.csv("household_power_consumption.txt",sep=";")
data2<-subset(data,as.Date(strptime(data$Date,"%d/%m/%Y"))=="2007-02-01" |as.Date(strptime(data$Date,"%d/%m/%Y"))=="2007-02-02")
Sys.setlocale("LC_TIME","English")
data2$X<-as.POSIXct(strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S"))
png("plot2.png",width = 480,height = 480)

with(data2,plot(X,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))

dev.off()
