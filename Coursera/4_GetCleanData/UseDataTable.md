Try To Use data.table package
========================================================


# 一级标题
## 二级标题
### 三级标题
#### 四级标题
##### 五级标题
###### 六级标题

## 列表
- 列表1
- 列表2
- 列表3

## 有序文本
1. 有序文本1
2. 有序文本2
3. 有序文本3

```{r computing}
x <- 1+1 # a simple calculator
set.seed(123)
rnorm(5)  # boring random numbers
```

```{r graphics}
par(mar = c(4, 4, .1, .1))
with(mtcars, {
  plot(mpg~hp, pch=20, col='darkgray')
  lines(lowess(hp, mpg))
})
```


# A Minimal Example for Markdown


This is a minimal example of using **knitr** to produce an _HTML_ page from _Markdown_.


## R code chunks


```{r setup}
# set global chunk options: images will be 7x5 inches
opts_chunk$set(fig.width=7, fig.height=5)
```


Now we write some code chunks in this markdown file:


```{r computing}
x <- 1+1 # a simple calculator
set.seed(123)
rnorm(5)  # boring random numbers
```


We can also produce plots:


```{r graphics}
par(mar = c(4, 4, .1, .1))
with(mtcars, {
  plot(mpg~hp, pch=20, col='darkgray')
  lines(lowess(hp, mpg))
})
```


## Inline code


Inline R code is also supported, e.g. the value of `x` is `r x`, and 2 &times; &pi;
= `r 2*pi`.


## Math


LaTeX math as usual: $f(\alpha, \beta) \propto x^{\alpha-1}(1-x)^{\beta-1}$.


## Misc


You can indent code chunks so they can nest within other environments such as lists.


1. the area of a circle with radius x
    ```{r foo}
    pi * x^2
    ```
2. OK, that is great


To compile me, use


```{r compile, eval=FALSE}
library(knitr)
knit('knitr-minimal.Rmd')
```


## Conclusion


Markdown is super easy to write. Go to **knitr** [homepage](http://yihui.name/knitr) for details.


[超链接简书](http://jianshu.io)
![图片](http://ww4.sinaimg.cn/bmiddle/aa397b7fjw1dzplsgpdw5j.jpg)

Project for Getting and Cleaning Data
=====================================

Author: Benjamin Chan (https://github.com/benjamin-chan/GettingAndCleaningData)


Parameters for the project
--------------------------

> The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  
>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
>
> Here are the data for the project: 
> 
> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
> 
> You should create one R script called run_analysis.R that does the following. 
> 
> 1. Merges the training and the test sets to create one data set.
> 2. Extracts only the measurements on the mean and standard deviation for each measurement.
> 3. Uses descriptive activity names to name the activities in the data set.
> 4. Appropriately labels the data set with descriptive activity names.
> 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
> 
> Good luck!


Steps to reproduce this project
-------------------------------
1. Open the R script `run_analysis.r` using a text editor.
2. Change the parameter of the `setwd` function call to the working directory/folder (i.e., the folder where these the R script file is saved).
3. Run the R script `run_analysis.r`. It calls the R Markdown file, `run_analysis.Rmd`, which contains the bulk of the code.

Outputs produced
----------------
* Tidy dataset file `DatasetHumanActivityRecognitionUsingSmartphones.txt` (tab-delimited text)
* Codebook file `codebook.md` (Markdown)

## Test script
```r
a <- c(1,1,2,3,4,5,6,7,8,9)
```
`asd`



Preliminaries
-------------

Load packages.


```r
packages <- c("data.table", "reshape2")
sapply(packages, require, character.only = TRUE, quietly = TRUE)
```

```
## data.table   reshape2 
##       TRUE       TRUE
```


Set path.


```r
path <- getwd()
path
```

```
## [1] "C:/Users/chanb/Documents/Repositories/Coursera/GettingAndCleaningData/Project"
```



Get the data
------------

Download the file. Put it in the `Data` folder. **This was already done on 2014-04-11; save time and don't evaluate again.**


```r
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f <- "Dataset.zip"
if (!file.exists(path)) {
    dir.create(path)
}
download.file(url, file.path(path, f))
```


Unzip the file. **This was already done on 2014-04-11; save time and don't evaluate again.**


```r
executable <- file.path("C:", "Program Files (x86)", "7-Zip", "7z.exe")
parameters <- "x"
cmd <- paste(paste0("\"", executable, "\""), parameters, paste0("\"", file.path(path, 
    f), "\""))
system(cmd)
```


The archive put the files in a folder named `UCI HAR Dataset`. Set this folder as the input path. List the files here.

