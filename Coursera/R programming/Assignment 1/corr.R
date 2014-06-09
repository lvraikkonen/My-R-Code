corr <- function(directory, threshold = 0) {
  ## the location of the CSV files
  path <- paste(c('~/',directory),collapse="")
  
  setwd(path)
  
  fileList <- list.files(path,pattern='*.csv')
  for(file in fileList){    
    dataset <- read.csv(file,header=TRUE)
    complete <- dataset[complete.cases(dataset),]
    if(nrow(complete) > threshold){
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