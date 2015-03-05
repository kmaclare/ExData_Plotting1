# read in data from text file
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
# merge date/time data into new column "date2" to do math/comparisons
df$date2 = strptime(paste(as.Date(df$Date, format = "%d/%m/%Y"), df$Time), format = "%Y-%m-%d %H:%M:%S")
# subset data into new data frame
df2 <- df[which((df$date2 >= "2007-02-01 00:00:00") & (df$date2 < "2007-02-03")),]

png(filename="plot3.png", width=480, height=480)
plot (df2$date2,df2$Sub_metering_1,type="n", ylim=c(0,39), # sets the x and y axes scales 
      
      xlab="",ylab="Energy sub metering") # adds titles to the axes 

lines(df2$date2,df2$Sub_metering_1,col="black",lwd=2.5) # adds a line for sub metering 1
lines(df2$date2,df2$Sub_metering_2,col="red",lwd=2.5) # adds a line for sub metering 2
lines(df2$date2,df2$Sub_metering_3,col="blue",lwd=2.5) # adds a line for sub metering 3

legend("topright", # places a legend at the appropriate place 
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), # puts text in the legend 
       
       lty=c(1,1), # gives the legend appropriate symbols (lines)
       
       lwd=c(2.5,2.5),col=c("black", "red", "blue")) # gives the legend lines the correct color and width

dev.off()