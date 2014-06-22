source("help_func.R")

## First step is to download and extract zip file
## download.data()

## run
setwd('UCI HAR Dataset/')
  

# Get the features  
feature.set <- read.table('features.txt', col.names = c('index', 'name'))
features <- subset(feature.set, grepl('-(mean|std)[(]', feature.set$name))
  
# Get the labels
label.set <- read.table('activity_labels.txt', col.names = c('level', 'label'))
  
# Read train and test data sets
train.set <- load.dataset('train', features, label.set)
test.set <- load.dataset('test', features, label.set)
  
# The raw data set
dataset <- rbind(train.set, test.set)
  
  
# Generate the tidy data set
tidy.dataset <- dataset[, lapply(.SD, mean), by=list(label, subject)]
# Fix the variable names
names <- names(tidy.dataset)
names <- gsub('-mean', 'Mean', names) # Replace `-mean' by `Mean'
names <- gsub('-std', 'Std', names) # Replace `-std' by 'Std'
names <- gsub('[()-]', '', names) # Remove the parenthesis and dashes
names <- gsub('BodyBody', 'Body', names) # Replace `BodyBody' by `Body'
setnames(tidy.dataset, names)
  
# Write the raw and the tidy data sets to files
setwd('..')
write.csv(tidy.dataset, file = 'tidydata.csv',
          row.names = FALSE, quote = FALSE)
