
createPlot2 <- function() 
{
	## read in the complete data file
	## separator is ";" so use read.csv2
	cat ("outcomes\n")
	outcomes <- read.csv2 ("household_power_consumption.txt", colClasses = "character")
	str (outcomes)
	
	cat ("dayOne\n")
	dayOne = subset (outcomes, outcomes$Date=="1/2/2007")
	str (dayOne)
	
	cat ("dayTwo\n")	
	dayTwo = subset (outcomes, outcomes$Date=="2/2/2007")
	str (dayTwo)

	# combine them into a single data frame
	cat ("data\n")	
	data = rbind(dayOne, dayTwo)
	str (data)

	## convert the column of interest to numeric
	cat ("Global_active_power\n")	
	data$Global_active_power = as.numeric (data$Global_active_power)
	str (data)
	
	## create a new DateTime column
	data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
		
	## open the graphics device
	png (filename = "plot2.png")
	
	## setup the graphics parameters
	par (bg = "transparent")
	
	## create the line plot
	plot (data$DateTime,
		data$Global_active_power, 
		type = "l",
		ylab="Global Active Power (kilowatts)",
        xlab="")

	## close the graphics device (which saves the PNG)
	dev.off()
}