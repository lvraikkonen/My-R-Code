pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## the location of the CSV files
  #path <- paste(c(getwd(),'/',directory),collapse="")
  path <- paste(c('~/',directory),collapse="")
  #print(path)
  
  setwd(path)
  
  fileList <- list.files(path,pattern='*.csv')
  
  for(i in id){    
    # if the merged dataset doesn't exist, create it
    if(!exists("dataset")){
      
      dataset <- read.csv(fileList[i],header=TRUE)
      print(fileList[i])
      
    }else{# if the merged dataset does exist, append to it
      
      temp_dataset <- read.csv(fileList[i],header=TRUE)
      dataset <- rbind(dataset,temp_dataset)
      rm(temp_dataset)
    
    }
  }
  #return(dataset)
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  result <- mean(dataset[[pollutant]],na.rm=TRUE)
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  return(result)
}