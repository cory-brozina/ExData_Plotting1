library(zoo)


#Importing the file
HPC1 <- read.csv("C:/Grad Classes/Research-ENGE/R/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)

#Setting file to specific set of days
HPC2<-HPC1[{HPC1$Date=="1/2/2007" | HPC1$Date=="2/2/2007"},]


#conversion stuff
HPC2$SM1<-as.numeric(as.character(HPC2$Sub_metering_1))
HPC2$SM2<-as.numeric(as.character(HPC2$Sub_metering_2))
HPC2$SM3<-as.numeric(as.character(HPC2$Sub_metering_3))
HPC2$GAP<- as.numeric(as.character(HPC2$Global_active_power))
HPC2$GRP<- as.numeric(as.character(HPC2$Global_reactive_power))
HPC2$V<- as.numeric(as.character(HPC2$Voltage))

#combining Date and Time into 1 string
HPC2$DT<-paste(as.character(HPC2$Date),as.character(HPC2$Time))

#create object
HPC2$DT<-strptime(HPC2$DT,"%d/%m/%Y %H:%M:%S")

#create plot
png("plot4.png", width=480, height=480)

#2x2 
par(mfrow=c(2,2))

#GAP
TS<- zoo(HPC2$GAP, HPC2$DT)
plot(TS, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#voltage
TS <- zoo(HPC2$V,HPC2$DT)
plot(TS, type="l", ylab="Voltage", xlab="Date time")

#submetering
TS <- zoo(HPC2$SM1[,c(7,8,9)], HPC2$DT)
plot(TS,  type="l", 
     col=c("black", "red", "blue"),
     ylab="Energy sub metering", 
     xlab="", 
     screens=1, 
     ylim=range(df[,c(7,8,9)]))

legend("topright", names(HPC2[,c(7,8,9)]), lty=1, cex=.5, border=NULL, 
       col=c("black", "red", "blue"))

#GRP
TS <- zoo(HPC2$GRP, HPC2$DT)
plot(TS, type="l", ylab="Global Reactive Power", xlab="Date time")

dev.off()