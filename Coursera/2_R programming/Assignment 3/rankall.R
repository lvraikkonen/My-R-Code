rankall <- function(outcome, num = "best"){
  ## Read outcome data
  hospDF <- read.csv("outcome-of-care-measures.csv",
                     colClasses = 'character',
                     stringsAsFactors= FALSE)
  
  ## Check that state and outcome are valid
  ## col  7: State
  ## col 11: Heart Attack
  ## col 17: Heart Failure
  ## col 23: Pneumonia
  
  # Check that outcome is valid
  if(outcome == 'heart attack'){
    colNum <- 11
  }
  else if(outcome == 'heart failure'){
    colNum <- 17
  }
  else if(outcome == 'pneumonia'){
    colNum <- 23
  }
  else{
    stop("Invalid Outcome Name!")
  }
  
  
  # get all state data
  data <- hospDF[, c(2,7,colNum)]
  data[,3] <- suppressWarnings(as.numeric(data[,3]))
  names(data)[3] <- "Death"
  
  # remove NA
  data <- data[!is.na(data$Death),]
  
  # for each state list
  splitData <- split(data,data$State)
  
  ### sort by Death & Hospital.Name
  rankedHospital <- lapply(splitData,function(x,num){
    sortedList <- x[order(x$Death,x$Hospital.Name),]
    
    ## for each item in list select the hospital name
    if(class(num) == "character") {
      if(num == "best") {
        return (sortedList$Hospital.Name[1])
      }
      else if(num == "worst") {
        return (sortedList$Hospital.Name[nrow(sortedList)])
      }
    }
    else {
      if(num > nrow(sortedList))
        return(NA)
      else
        return (sortedList$Hospital.Name[num])
    }
    
  }## ... agrument for inner function
  ,num)
  
  # return specified rank hospital name
  return(data.frame(hospital = unlist(rankedHospital),
                    state = names(rankedHospital),
                    stringsAsFactors = FALSE))
}