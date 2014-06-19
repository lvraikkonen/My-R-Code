library(data.table)


# The function downloads the Samsung data and extracts it
download.data <- function () {
  zip.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  zip.file <- 'dataset.zip'
  
  
  download.file(zip.url, destfile = zip.file)
  unzip(zip.file)
}


# The function loads and processes either a train or a test data set,
# given that current directory is the Samsung data set.
load.dataset <- function (set, features, labels) {
  # Construct the relative pathes of data files
  prefix <- paste(set, '/', sep = '')
  file.data <- paste(prefix, 'X_', set, '.txt', sep = '')
  file.label <- paste(prefix, 'y_', set, '.txt', sep = '')
  file.subject <- paste(prefix, 'subject_', set, '.txt', sep = '')
  
  
  # Cannot load the data using fread() function.
  # fread() fails to determine the correct number of columns in dataset.
  # So we read the data into a data.frame and then transform it into data.table
  data <- read.table(file.data)[, features$index]
  names(data) <- features$name
  
  
  label.set <- read.table(file.label)[, 1]
  data$label <- factor(label.set, levels=labels$level, labels=labels$label)
  
  
  subject.set <- read.table(file.subject)[, 1]
  data$subject <- factor(subject.set)
  
  
  # convert to data table
  data.table(data)
}


run.analysis <- function () {
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
  write.csv(dataset, file = 'rawdata.csv', row.names = FALSE)
  write.csv(tidy.dataset, file = 'tidydata.csv',
            row.names = FALSE, quote = FALSE)
  
  
  # Return the tidy data set
  tidy.dataset
}
