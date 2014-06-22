library(data.table)


# Download the Samsung data and extracts it
download.data <- function () {
  zip.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  zip.file <- 'dataset.zip'
  
  download.file(zip.url, destfile = zip.file,method="curl")
  unzip(zip.file)
}


# Loads and processes train and test data set
load.dataset <- function (set, features, labels) {
  # Construct the relative pathes of data files
  prefix <- paste(set, '/', sep = '')
  file.data <- paste(prefix, 'X_', set, '.txt', sep = '')
  file.label <- paste(prefix, 'y_', set, '.txt', sep = '')
  file.subject <- paste(prefix, 'subject_', set, '.txt', sep = '')
  
  # Cannot load the data using fread() function.
  data <- read.table(file.data)[, features$index]
  names(data) <- features$name
  
  
  label.set <- read.table(file.label)[, 1]
  data$label <- factor(label.set, levels=labels$level, labels=labels$label)
  
  
  subject.set <- read.table(file.subject)[, 1]
  data$subject <- factor(subject.set)
  
  # convert to data table
  data.table(data)
}