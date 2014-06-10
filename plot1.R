
#Importing the file
HPC1 <- read.csv("C:/Grad Classes/Research-ENGE/R/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)

#Setting file to specific set of days
HPC2days<-HPC1[{HPC1$Date=="1/2/2007" | HPC1$Date=="2/2/2007"},]

#Create histogram
png(filename="plot1.png",height=480,width=480)

x<-hist(HPC2days$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
             
             