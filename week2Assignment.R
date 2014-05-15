pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## the location of the CSV files
  # path <- paste(c(getwd(),'/',directory),collapse="")
  path <- paste(c('~/',directory),collapse="")
  # print(path)
  
  setwd(path)
  
  fileList <- list.files(path,pattern='*.csv')
  
  for(i in id){    
    # if the merged dataset doesn't exist, create it
    if(!exists("dataset")){
      
      dataset <- read.csv(fileList[i],header=TRUE)
      # print(fileList[i])
      
    }else{# if the merged dataset does exist, append to it
      
      temp_dataset <- read.csv(fileList[i],header=TRUE)
      dataset <- rbind(dataset,temp_dataset)
      rm(temp_dataset)
    
    }
  }
  # return(dataset)
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  result <- mean(dataset[[pollutant]],na.rm=TRUE)
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  return(result)
}



complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  path <- paste(c('~/',directory),collapse="")
  # print(path)
  
  setwd(path)
  
  fileList <- list.files(path,pattern='*.csv')
  
  for(i in id){ 
    dataset <- read.csv(fileList[i],header=TRUE)
    id <- i
    nobs <- nrow(dataset[complete.cases(dataset),])
    
    if(!exists("result"))
      result <- data.frame(id,nobs)
    else{
      result <- rbind(result,c(id,nobs))
    }
    
  }
  
  return(result)
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
}



corr <- function(directory, threshold = 0) {
  ## the location of the CSV files
  path <- paste(c('~/',directory),collapse="")
  
  setwd(path)
  
  fileList <- list.files(path,pattern='*.csv')
  for(file in fileList){    
    dataset <- read.csv(file,header=TRUE)
    complete <- dataset[complete.cases(dataset),]
    if(nrow(complete) > threshold){
      # calculate cor for dataset meet requirement
      sulfate <- complete$sulfate
      nitrate <- complete$nitrate
      if(!exists('result'))
        result <- cor(sulfate,nitrate)
      else{
        result <- rbind(result,cor(sulfate,nitrate))
      }
    }
  }
  if(!exists('result'))
    return(vector(mode='numeric'))
  
  return(result)
}
