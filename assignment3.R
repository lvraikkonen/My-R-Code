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
