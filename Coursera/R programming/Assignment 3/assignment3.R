getwd()
setwd("C:/Users/v-shuolv/Documents/GitHub/My-R-Code")

## Part 1
outcome <- read.csv("outcome-of-care-measures.csv",
                    colClasses = 'character')
head(outcome)
ncol(outcome)
names(outcome)

outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11])


## Part 2
## Finding the best hospital in a state
best <- function(state, outcome) {
  ## Read outcome data: COLS: Hospital.Name, State, HeartAttack, HearFailure, Pneumonia
  data <- read.csv("outcome-of-care-measures.csv",
                   colClasses = "character")[,c(2,7,11,17,23)]
  
  ## check state and outcome are valid
  if(! ( state %in% factor(data$State) ) ) {
    stop("invalid state")
  }
  
  if(! (outcome == "heart attack" || 
        outcome == "heart failure" || 
        outcome == "pneumonia") ) {
    stop("invalid outcome")
  }
  
  ## get the state data
  data <- data[data$State == state,c(1,3,4,5)]
  
  if(outcome == "heart attack") {
    data <- data[,c(1,2)]
  } else if(outcome == "heart failure") {
    data <- data[,c(1,3)]
  } else if(outcome == "pneumonia") {
    data <- data[,c(1,4)]
  }
  
  ## rename kind of rate
  names(data)[2] <- "Death"
  data[,2] <- suppressWarnings(as.numeric(data[,2]))
  
  ## remove NA
  data <- data[!is.na(data[,2]),]
  
  ## order
  data <- data[order(data$Death,data$Hospital.Name),]
  
  return(data$Hospital.Name[1])
}


## Part 3
## Rank hospital by outcome in a state
rankhospital <- function(state,outcome, num = "best"){
  ## read data
  ## COLS: Hospital.Name, State, HeartAttack, HearFailure, Pneumonia
  data <- read.csv("outcome-of-care-measures.csv",
                   colClasses = "character")[,c(2,7,11,17,23)]
  
  ## check state and outcome are valid
  if(! ( state %in% factor(data$State) ) ) {
    stop("invalid state")
  }
  
  if(! (outcome == "heart attack" || 
          outcome == "heart failure" || 
          outcome == "pneumonia") ) {
    stop("invalid outcome")
  }
  
  ## get the state data
  data <- data[data$State == state,c(1,3,4,5)]
  
  if(outcome == "heart attack") {
    data <- data[,c(1,2)]
  } else if(outcome == "heart failure") {
    data <- data[,c(1,3)]
  } else if(outcome == "pneumonia") {
    data <- data[,c(1,4)]
  }
  
  names(data)[2] <- "Death"
  data[,2] <- suppressWarnings(as.numeric(data[,2]))
  
  ## remove NAs
  data <- data[!is.na(data[,2]),]
  
  ## order
  data <- data[order(data$Death,data$Hospital.Name),]
  
  ## Return hospital name with given rank
  if(class(num) == "character"){
    if(num == "best"){
      return(data$Hospital.Name[1])
    }
    else if(num == "worst"){
      return(data$Hospital.Name[nrow(data)])
    }
  }
  else{
    if(num > nrow(data))
      return(NA)
    else{
      return(data$Hospital.Name[num])
    }
  }
}



## Part 4
## Rank hospitals in all state
rankall <- function(outcome, num = "best"){
  ## read data
  ## COLS: Hospital.Name, State, HeartAttack, HearFailure, Pneumonia
  data <- read.csv("outcome-of-care-measures.csv",
                   colClasses = "character")[,c(2,7,11,17,23)]
  
  ## check outcome is valid
  if(! (outcome == "heart attack" || 
          outcome == "heart failure" || 
          outcome == "pneumonia") ) {
    stop("invalid outcome")
  }
  
  if(outcome == "heart attack") {
    data <- data[,c(1,2,3)]
  } else if(outcome == "heart failure") {
    data <- data[,c(1,2,4)]
  } else if(outcome == "pneumonia") {
    data <- data[,c(1,2,5)]
  }
  
  names(data)[3] <- "Death"
  data[,3] <- suppressWarnings(as.numeric(data[,3]))
  
  ## remove NAs
  data <- data[!is.na(data[,3]),]
  
  ## split data into some data frame
  splited = split(data, data$State)
  
  ## use lapply to sort each data frame in list
  rankedHospital <- lapply(splited,function(x,num){
    x <- x[order(x$Death,x$Hospital.Name),]
    ## return hospital list
    if(class(num) == "character"){
      if(num == "best"){
        return(x$Hospital.Name[1])
      }
      else if(num == "worst"){
        return(x$Hospital.Name[nrow(x)])
      }
    }
    else{
      if(num > nrow(x)) return(NA)
      else return(x$Hospital.Name[num])
    }
  },num)
  
  #return(rankedHospital)
  
  return(data.frame(hospital = unlist(rankedHospital),
                    state = names(rankedHospital)))
}