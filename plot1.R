
createPlot1 <- function() 
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
	
	## open the graphics device
	png (filename = "plot1.png")
	
	## setup the graphics parameters
	par (bg = "transparent")
	
	## create the histogram
	hist (data$Global_active_power, 
		main="Global Active Power", 
		xlab="Global Active Power (kilowatts)", 
		ylab = "Frequency",
		col = "red")

	## close the graphics device (which saves the PNG)
	dev.off()
}