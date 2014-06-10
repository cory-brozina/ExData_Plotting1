library(zoo)

#Importing the file
HPC1 <- read.csv("C:/Grad Classes/Research-ENGE/R/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)

#Setting file to specific set of days
HPC2<-HPC1[{HPC1$Date=="1/2/2007" | HPC1$Date=="2/2/2007"},]

#Make numeric
HPC2$SM1<-as.numeric(as.character(HPC2$Sub_metering_1))
HPC2$SM2<-as.numeric(as.character(HPC2$Sub_metering_2))
HPC2$SM3<-as.numeric(as.character(HPC2$Sub_metering_3))

#combining Date and Time into 1 string
HPC2$DT<-paste(as.character(HPC2$Date),as.character(HPC2$Time))

#create object
HPC2$DT<-strptime(HPC2$DT,"%d/%m/%Y %H:%M:%S")

#create object
TS<-zoo(HPC2[,c(7,8,9)],HPC2$DT)

#create plot
png("plot3.png",width=480,height=480)
plot(TS,col=c("black","red","blue"),ylab="Energy sub metering",xlab="",screens=1,ylim=range(HPC2[,c(7,8,9)]))

legend("topright",names(HPC2[,c(7,8,9)]),lty=1,cex=.65,col=c("black","red","blue"))
dev.off()


