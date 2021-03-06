# read in data from text file
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
# merge date/time data into new column "date2" to do math/comparisons
df$date2 = strptime(paste(as.Date(df$Date, format = "%d/%m/%Y"), df$Time), format = "%Y-%m-%d %H:%M:%S")
# subset data into new data frame
df2 <- df[which((df$date2 >= "2007-02-01 00:00:00") & (df$date2 < "2007-02-03")),]

png(filename="plot1.png", width=480, height=480)
hist(as.numeric(df2$Global_active_power)/500, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()