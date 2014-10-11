source ("getData.R")

createPlot1 <- function() 
{
	## get the data for the two days
  cat ("data")
	data = getData()
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