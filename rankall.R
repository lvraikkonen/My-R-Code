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
  
  ## Return hospital name in that state with the given rank
  rankNum <- 1
  if(num == "best"){
    desc <- FALSE #Lower better
  }else if(num == "worst"){
    desc  <- TRUE
  }else{
    rankNum <- num
    desc <- FALSE
    if(num > nrow(data))
      return(NA)
  }
  
  return(data)
  result <- data[order(
    as.numeric(data[,3]),
    #data[,1],
    na.last=NA,
    decreasing = desc),]
  
  #return hospital name
  #maybe split()
  
  #return(result[rankNum,]$Hospital.Name)
}