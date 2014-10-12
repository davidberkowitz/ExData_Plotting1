source ("getData.R")

createPlot2 <- function() 
{
  ## get the data for the two days
  cat ("data\n")
  data = getData()
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