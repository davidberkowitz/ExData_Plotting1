
getData <- function() 
{
  ## check first - does the data file already exist?
  
  if (file.exists("data.rds"))
  {
    data <- readRDS("data.rds")
    return (data)
  }
  
  # file does not exist yet - create it
  
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
  
  # write out the data to a file
	saveRDS(data, file="data.rds")
  
  return (data)
}