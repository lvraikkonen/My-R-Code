complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  path <- paste(c('~/',directory),collapse="")
  #print(path)
  
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