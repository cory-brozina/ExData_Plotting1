
library(zoo)

#Importing the file
HPC1 <- read.csv("C:/Grad Classes/Research-ENGE/R/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)

#Setting file to specific set of days
HPC2days<-HPC1[{HPC1$Date=="1/2/2007" | HPC1$Date=="2/2/2007"},]

#make numeric
HPC2days$Global_active_power<-as.numeric(as.character(HPC2days$Global_active_power))

#combining Date and Time into 1 string
HPC2days$DT<-paste(as.character(HPC2days$Date),as.character(HPC2days$Time))

#create object
HPC2days$DT<-strptime(HPC2days$DT,"%d/%m/%Y %H:%M:%S")

#time series
TS<-zoo(HPC2days$Global_active_power,HPC2days$DT)

#Create graph
png(filename="plot2.png",height=480,width=480)
plot(TS,ylab="Global Active Power (kilowats)",xlab="")
dev.off()



