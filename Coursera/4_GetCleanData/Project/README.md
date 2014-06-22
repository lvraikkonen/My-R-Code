Project for Getting and Cleaning Data
======================================

Steps to reproduce this project
-------------------------------

1. Open the R script `run_analysis.r` using a text editor.
2. Change the parameter of the `setwd()` function call to the working directory/folder (i.e., the folder where these the R script file is saved).
3. Run the R script `run_analysis.r`.


Outputs produced
----------------
* Tidy dataset file `tidydata.csv`
* Codebook file `CodeBook.md` (Markdown)


The `help_func.R` script contains 2 functions performs the following jobs:
 * download the source data
 * reads train and test data sets and merges them
 * processes the merged data set (extract the relevant variables,
   adds descriptive activity names, etc.)

If data available (downloaded) in the current directory, just run:

```r
source('./run_analysis.R')
```

Otherwise, you can use `download.data()` function provided in the script.
The function will download the data archive and extract it.
After that you can run `run.analysis()`. The full code:

```r
source("./help_func.R")
download.data() # download samsung data and unzip it
source('./run_analysis.R')
```

### Tidy data set

Tidy data set contains the same variables as the raw does, but the variables
were renamed according to following rules:
 * `All lower case when possible` - the variables names **were not** converted
   to lower case, since it would make them unreadable.
   Instead, the variable names were converted to satisfy `camlCase` rule.
 * `Descriptive (Diagnosis versus Dx)` - the variable names are descriptive,
   so nothing special should be done.
 * `Not duplicated` - the variable names are unique, so again nothing special
   had to be done.
 * `Not have underscores or dots or white spaces` - dashes and parentheses
   were removed from variable names.

To satisfy the requirements above, the following replacements were performed:
 1. Replace `-mean` with `Mean`
 1. Replace `-std` with `Std`
 1. Remove characters `-()`
 1. Replace `BodyBody` with `Body`

### Code book

Please check in `Codebook.md` file.