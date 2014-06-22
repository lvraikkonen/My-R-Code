Tidy data codebook
========================================================

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

### Variables in raw and tidy data set

 Raw data set | Tidy data set
 -------------|--------------
 subject | subject
 label | label
 tBodyAcc-mean()-X | tBodyAccMeanX
 tBodyAcc-mean()-Y | tBodyAccMeanY
 tBodyAcc-mean()-Z | tBodyAccMeanZ
 tBodyAcc-std()-X | tBodyAccStdX
 tBodyAcc-std()-Y | tBodyAccStdY
 tBodyAcc-std()-Z | tBodyAccStdZ
 tGravityAcc-mean()-X | tGravityAccMeanX
 tGravityAcc-mean()-Y | tGravityAccMeanY
 tGravityAcc-mean()-Z | tGravityAccMeanZ
 tGravityAcc-std()-X | tGravityAccStdX
 tGravityAcc-std()-Y | tGravityAccStdY
 tGravityAcc-std()-Z | tGravityAccStdZ
 tBodyAccJerk-mean()-X | tBodyAccJerkMeanX
 tBodyAccJerk-mean()-Y | tBodyAccJerkMeanY
 tBodyAccJerk-mean()-Z | tBodyAccJerkMeanZ
 tBodyAccJerk-std()-X | tBodyAccJerkStdX
 tBodyAccJerk-std()-Y | tBodyAccJerkStdY
 tBodyAccJerk-std()-Z | tBodyAccJerkStdZ
 tBodyGyro-mean()-X | tBodyGyroMeanX
 tBodyGyro-mean()-Y | tBodyGyroMeanY
 tBodyGyro-mean()-Z | tBodyGyroMeanZ
 tBodyGyro-std()-X | tBodyGyroStdX
 tBodyGyro-std()-Y | tBodyGyroStdY
 tBodyGyro-std()-Z | tBodyGyroStdZ
 tBodyGyroJerk-mean()-X | tBodyGyroJerkMeanX
 tBodyGyroJerk-mean()-Y | tBodyGyroJerkMeanY
 tBodyGyroJerk-mean()-Z | tBodyGyroJerkMeanZ
 tBodyGyroJerk-std()-X | tBodyGyroJerkStdX
 tBodyGyroJerk-std()-Y | tBodyGyroJerkStdY
 tBodyGyroJerk-std()-Z | tBodyGyroJerkStdZ
 tBodyAccMag-mean() | tBodyAccMagMean
 tBodyAccMag-std() | tBodyAccMagStd
 tGravityAccMag-mean() | tGravityAccMagMean
 tGravityAccMag-std() | tGravityAccMagStd
 tBodyAccJerkMag-mean() | tBodyAccJerkMagMean
 tBodyAccJerkMag-std() | tBodyAccJerkMagStd
 tBodyGyroMag-mean() | tBodyGyroMagMean
 tBodyGyroMag-std() | tBodyGyroMagStd
 tBodyGyroJerkMag-mean() | tBodyGyroJerkMagMean
 tBodyGyroJerkMag-std() | tBodyGyroJerkMagStd
 fBodyAcc-mean()-X | fBodyAccMeanX
 fBodyAcc-mean()-Y | fBodyAccMeanY
 fBodyAcc-mean()-Z | fBodyAccMeanZ
 fBodyAcc-std()-X | fBodyAccStdX
 fBodyAcc-std()-Y | fBodyAccStdY
 fBodyAcc-std()-Z | fBodyAccStdZ
 fBodyAccJerk-mean()-X | fBodyAccJerkMeanX
 fBodyAccJerk-mean()-Y | fBodyAccJerkMeanY
 fBodyAccJerk-mean()-Z | fBodyAccJerkMeanZ
 fBodyAccJerk-std()-X | fBodyAccJerkStdX
 fBodyAccJerk-std()-Y | fBodyAccJerkStdY
 fBodyAccJerk-std()-Z | fBodyAccJerkStdZ
 fBodyGyro-mean()-X | fBodyGyroMeanX
 fBodyGyro-mean()-Y | fBodyGyroMeanY
 fBodyGyro-mean()-Z | fBodyGyroMeanZ
 fBodyGyro-std()-X | fBodyGyroStdX
 fBodyGyro-std()-Y | fBodyGyroStdY
 fBodyGyro-std()-Z | fBodyGyroStdZ
 fBodyAccMag-mean() | fBodyAccMagMean
 fBodyAccMag-std() | fBodyAccMagStd
 fBodyBodyAccJerkMag-mean() | fBodyAccJerkMagMean
 fBodyBodyAccJerkMag-std() | fBodyAccJerkMagStd
 fBodyBodyGyroMag-mean() | fBodyGyroMagMean
 fBodyBodyGyroMag-std() | fBodyGyroMagStd
 fBodyBodyGyroJerkMag-mean() | fBodyGyroJerkMagMean
 fBodyBodyGyroJerkMag-std() | fBodyGyroJerkMagStd
 
Variable list and descriptions
------------------------------

Variable name    | Description
-----------------|------------
subject          | ID the subject who performed the activity for each window sample. Its range is from 1 to 30.
activity         | Activity name
featDomain       | Feature: Time domain signal or frequency domain signal (Time or Freq)
featInstrument   | Feature: Measuring instrument (Accelerometer or Gyroscope)
featAcceleration | Feature: Acceleration signal (Body or Gravity)
featVariable     | Feature: Variable (Mean or SD)
featJerk         | Feature: Jerk signal
featMagnitude    | Feature: Magnitude of the signals calculated using the Euclidean norm
featAxis         | Feature: 3-axial signals in the X, Y and Z directions (X, Y, or Z)
featCount        | Feature: Count of data points used to compute `average`
featAverage      | Feature: Average of each variable for each activity and each subject

Dataset structure
-----------------


```r
str(tidy.dataset)
```

```
Classes ‘data.table’ and 'data.frame':  180 obs. of  68 variables:
 $ label               : Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 5 4 6 1 3 2 5 4 6 1 ...
 $ subject             : Factor w/ 30 levels "1","3","5","6",..: 1 1 1 1 1 1 2 2 2 2 ...
 $ tBodyAccMeanX       : num  0.279 0.261 0.222 0.277 0.289 ...
 $ tBodyAccMeanY       : num  -0.01614 -0.00131 -0.04051 -0.01738 -0.00992 ...
 $ tBodyAccMeanZ       : num  -0.111 -0.105 -0.113 -0.111 -0.108 ...
 $ tBodyAccStdX        : num  -0.996 -0.977 -0.928 -0.284 0.03 ...
 $ tBodyAccStdY        : num  -0.9732 -0.9226 -0.8368 0.1145 -0.0319 ...
 $ tBodyAccStdZ        : num  -0.98 -0.94 -0.826 -0.26 -0.23 ...
 $ tGravityAccMeanX    : num  0.943 0.832 -0.249 0.935 0.932 ...
 $ tGravityAccMeanY    : num  -0.273 0.204 0.706 -0.282 -0.267 ...
 $ tGravityAccMeanZ    : num  0.0135 0.332 0.4458 -0.0681 -0.0621 ...
 $ tGravityAccStdX     : num  -0.994 -0.968 -0.897 -0.977 -0.951 ...
 $ tGravityAccStdY     : num  -0.981 -0.936 -0.908 -0.971 -0.937 ...
 $ tGravityAccStdZ     : num  -0.976 -0.949 -0.852 -0.948 -0.896 ...
 $ tBodyAccJerkMeanX   : num  0.0754 0.0775 0.0811 0.074 0.0542 ...
 $ tBodyAccJerkMeanY   : num  0.007976 -0.000619 0.003838 0.028272 0.02965 ...
 $ tBodyAccJerkMeanZ   : num  -0.00369 -0.00337 0.01083 -0.00417 -0.01097 ...
 $ tBodyAccJerkStdX    : num  -0.9946 -0.9864 -0.9585 -0.1136 -0.0123 ...
 $ tBodyAccJerkStdY    : num  -0.986 -0.981 -0.924 0.067 -0.102 ...
 $ tBodyAccJerkStdZ    : num  -0.992 -0.988 -0.955 -0.503 -0.346 ...
 $ tBodyGyroMeanX      : num  -0.024 -0.0454 -0.0166 -0.0418 -0.0351 ...
 $ tBodyGyroMeanY      : num  -0.0594 -0.0919 -0.0645 -0.0695 -0.0909 ...
 $ tBodyGyroMeanZ      : num  0.0748 0.0629 0.1487 0.0849 0.0901 ...
 $ tBodyGyroStdX       : num  -0.987 -0.977 -0.874 -0.474 -0.458 ...
 $ tBodyGyroStdY       : num  -0.9877 -0.9665 -0.9511 -0.0546 -0.1263 ...
 $ tBodyGyroStdZ       : num  -0.981 -0.941 -0.908 -0.344 -0.125 ...
 $ tBodyGyroJerkMeanX  : num  -0.0996 -0.0937 -0.1073 -0.09 -0.074 ...
 $ tBodyGyroJerkMeanY  : num  -0.0441 -0.0402 -0.0415 -0.0398 -0.044 ...
 $ tBodyGyroJerkMeanZ  : num  -0.049 -0.0467 -0.0741 -0.0461 -0.027 ...
 $ tBodyGyroJerkStdX   : num  -0.993 -0.992 -0.919 -0.207 -0.487 ...
 $ tBodyGyroJerkStdY   : num  -0.995 -0.99 -0.968 -0.304 -0.239 ...
 $ tBodyGyroJerkStdZ   : num  -0.992 -0.988 -0.958 -0.404 -0.269 ...
 $ tBodyAccMagMean     : num  -0.9843 -0.9485 -0.8419 -0.137 0.0272 ...
 $ tBodyAccMagStd      : num  -0.9819 -0.9271 -0.7951 -0.2197 0.0199 ...
 $ tGravityAccMagMean  : num  -0.9843 -0.9485 -0.8419 -0.137 0.0272 ...
 $ tGravityAccMagStd   : num  -0.9819 -0.9271 -0.7951 -0.2197 0.0199 ...
 $ tBodyAccJerkMagMean : num  -0.9924 -0.9874 -0.9544 -0.1414 -0.0894 ...
 $ tBodyAccJerkMagStd  : num  -0.9931 -0.9841 -0.9282 -0.0745 -0.0258 ...
 $ tBodyGyroMagMean    : num  -0.9765 -0.9309 -0.8748 -0.161 -0.0757 ...
 $ tBodyGyroMagStd     : num  -0.979 -0.935 -0.819 -0.187 -0.226 ...
 $ tBodyGyroJerkMagMean: num  -0.995 -0.992 -0.963 -0.299 -0.295 ...
 $ tBodyGyroJerkMagStd : num  -0.995 -0.988 -0.936 -0.325 -0.307 ...
 $ fBodyAccMeanX       : num  -0.9952 -0.9796 -0.9391 -0.2028 0.0382 ...
 $ fBodyAccMeanY       : num  -0.97707 -0.94408 -0.86707 0.08971 0.00155 ...
 $ fBodyAccMeanZ       : num  -0.985 -0.959 -0.883 -0.332 -0.226 ...
 $ fBodyAccStdX        : num  -0.996 -0.9764 -0.9244 -0.3191 0.0243 ...
 $ fBodyAccStdY        : num  -0.972 -0.917 -0.834 0.056 -0.113 ...
 $ fBodyAccStdZ        : num  -0.978 -0.934 -0.813 -0.28 -0.298 ...
 $ fBodyAccJerkMeanX   : num  -0.9946 -0.9866 -0.9571 -0.1705 -0.0277 ...
 $ fBodyAccJerkMeanY   : num  -0.9854 -0.9816 -0.9225 -0.0352 -0.1287 ...
 $ fBodyAccJerkMeanZ   : num  -0.991 -0.986 -0.948 -0.469 -0.288 ...
 $ fBodyAccJerkStdX    : num  -0.9951 -0.9875 -0.9642 -0.1336 -0.0863 ...
 $ fBodyAccJerkStdY    : num  -0.987 -0.983 -0.932 0.107 -0.135 ...
 $ fBodyAccJerkStdZ    : num  -0.992 -0.988 -0.961 -0.535 -0.402 ...
 $ fBodyGyroMeanX      : num  -0.986 -0.976 -0.85 -0.339 -0.352 ...
 $ fBodyGyroMeanY      : num  -0.989 -0.9758 -0.9522 -0.1031 -0.0557 ...
 $ fBodyGyroMeanZ      : num  -0.9808 -0.9513 -0.9093 -0.2559 -0.0319 ...
 $ fBodyGyroStdX       : num  -0.987 -0.978 -0.882 -0.517 -0.495 ...
 $ fBodyGyroStdY       : num  -0.9871 -0.9623 -0.9512 -0.0335 -0.1814 ...
 $ fBodyGyroStdZ       : num  -0.982 -0.944 -0.917 -0.437 -0.238 ...
 $ fBodyAccMagMean     : num  -0.9854 -0.9478 -0.8618 -0.1286 0.0966 ...
 $ fBodyAccMagStd      : num  -0.982 -0.928 -0.798 -0.398 -0.187 ...
 $ fBodyAccJerkMagMean : num  -0.9925 -0.9853 -0.9333 -0.0571 0.0262 ...
 $ fBodyAccJerkMagStd  : num  -0.993 -0.982 -0.922 -0.103 -0.104 ...
 $ fBodyGyroMagMean    : num  -0.985 -0.958 -0.862 -0.199 -0.186 ...
 $ fBodyGyroMagStd     : num  -0.978 -0.932 -0.824 -0.321 -0.398 ...
 $ fBodyGyroJerkMagMean: num  -0.995 -0.99 -0.942 -0.319 -0.282 ...
 $ fBodyGyroJerkMagStd : num  -0.995 -0.987 -0.933 -0.382 -0.392 ...
 - attr(*, ".internal.selfref")=<externalptr> 
```


Show a few rows of the dataset
------------------------------


```r
head(tidy.dataset)
```

```
                label subject tBodyAccMeanX tBodyAccMeanY tBodyAccMeanZ tBodyAccStdX
1:           STANDING       1     0.2789176  -0.016137590    -0.1106018  -0.99575990
2:            SITTING       1     0.2612376  -0.001308288    -0.1045442  -0.97722901
3:             LAYING       1     0.2215982  -0.040513953    -0.1132036  -0.92805647
4:            WALKING       1     0.2773308  -0.017383819    -0.1111481  -0.28374026
5: WALKING_DOWNSTAIRS       1     0.2891883  -0.009918505    -0.1075662   0.03003534
6:   WALKING_UPSTAIRS       1     0.2554617  -0.023953149    -0.0973020  -0.35470803
   tBodyAccStdY tBodyAccStdZ tGravityAccMeanX tGravityAccMeanY tGravityAccMeanZ
1: -0.973190056  -0.97977588        0.9429520       -0.2729838       0.01349058
2: -0.922618642  -0.93958629        0.8315099        0.2044116       0.33204370
3: -0.836827406  -0.82606140       -0.2488818        0.7055498       0.44581772
4:  0.114461337  -0.26002790        0.9352232       -0.2821650      -0.06810286
5: -0.031935943  -0.23043421        0.9318744       -0.2666103      -0.06211996
6: -0.002320265  -0.01947924        0.8933511       -0.3621534      -0.07540294
   tGravityAccStdX tGravityAccStdY tGravityAccStdZ tBodyAccJerkMeanX tBodyAccJerkMeanY
1:      -0.9937630      -0.9812260      -0.9763241        0.07537665      0.0079757309
2:      -0.9684571      -0.9355171      -0.9490409        0.07748252     -0.0006191028
3:      -0.8968300      -0.9077200      -0.8523663        0.08108653      0.0038382040
4:      -0.9766096      -0.9713060      -0.9477172        0.07404163      0.0282721096
5:      -0.9505598      -0.9370187      -0.8959397        0.05415532      0.0296504490
6:      -0.9563670      -0.9528492      -0.9123794        0.10137273      0.0194863076
   tBodyAccJerkMeanZ tBodyAccJerkStdX tBodyAccJerkStdY tBodyAccJerkStdZ tBodyGyroMeanX
1:      -0.003685250      -0.99460454       -0.9856487       -0.9922512    -0.02398773
2:      -0.003367792      -0.98643071       -0.9813720       -0.9879108    -0.04535006
3:       0.010834236      -0.95848211       -0.9241493       -0.9548551    -0.01655309
4:      -0.004168406      -0.11361560        0.0670025       -0.5026998    -0.04183096
5:      -0.010971973      -0.01228386       -0.1016014       -0.3457350    -0.03507819
6:      -0.045562545      -0.44684389       -0.3782744       -0.7065935     0.05054938
   tBodyGyroMeanY tBodyGyroMeanZ tBodyGyroStdX tBodyGyroStdY tBodyGyroStdZ
1:    -0.05939722     0.07480075    -0.9871919  -0.987734440    -0.9806456
2:    -0.09192415     0.06293138    -0.9772113  -0.966473895    -0.9414259
3:    -0.06448612     0.14868944    -0.8735439  -0.951090440    -0.9082847
4:    -0.06953005     0.08494482    -0.4735355  -0.054607769    -0.3442666
5:    -0.09093713     0.09008501    -0.4580305  -0.126349195    -0.1247025
6:    -0.16617002     0.05835955    -0.5448711   0.004105184    -0.5071687
   tBodyGyroJerkMeanX tBodyGyroJerkMeanY tBodyGyroJerkMeanZ tBodyGyroJerkStdX
1:        -0.09960921        -0.04406279        -0.04895055        -0.9929451
2:        -0.09367938        -0.04021181        -0.04670263        -0.9917316
3:        -0.10727095        -0.04151729        -0.07405012        -0.9186085
4:        -0.08999754        -0.03984287        -0.04613093        -0.2074219
5:        -0.07395920        -0.04399028        -0.02704611        -0.4870273
6:        -0.12223277        -0.04214859        -0.04071255        -0.6147865
   tBodyGyroJerkStdY tBodyGyroJerkStdZ tBodyAccMagMean tBodyAccMagStd
1:        -0.9951379        -0.9921085     -0.98427821    -0.98194293
2:        -0.9895181        -0.9879358     -0.94853679    -0.92707842
3:        -0.9679072        -0.9577902     -0.84192915    -0.79514486
4:        -0.3044685        -0.4042555     -0.13697118    -0.21968865
5:        -0.2388248        -0.2687615      0.02718829     0.01988435
6:        -0.6016967        -0.6063320     -0.12992763    -0.32497093
   tGravityAccMagMean tGravityAccMagStd tBodyAccJerkMagMean tBodyAccJerkMagStd
1:        -0.98427821       -0.98194293         -0.99236779        -0.99309621
2:        -0.94853679       -0.92707842         -0.98736420        -0.98412002
3:        -0.84192915       -0.79514486         -0.95439626        -0.92824563
4:        -0.13697118       -0.21968865         -0.14142881        -0.07447175
5:         0.02718829        0.01988435         -0.08944748        -0.02578772
6:        -0.12992763       -0.32497093         -0.46650345        -0.47899162
   tBodyGyroMagMean tBodyGyroMagStd tBodyGyroJerkMagMean tBodyGyroJerkMagStd
1:      -0.97649379      -0.9786900           -0.9949668          -0.9947332
2:      -0.93089249      -0.9345318           -0.9919763          -0.9883087
3:      -0.87475955      -0.8190102           -0.9634610          -0.9358410
4:      -0.16097955      -0.1869784           -0.2987037          -0.3253249
5:      -0.07574125      -0.2257244           -0.2954638          -0.3065106
6:      -0.12673559      -0.1486193           -0.5948829          -0.6485530
   fBodyAccMeanX fBodyAccMeanY fBodyAccMeanZ fBodyAccStdX fBodyAccStdY fBodyAccStdZ
1:   -0.99524993  -0.977070848    -0.9852971  -0.99602835  -0.97229310  -0.97793726
2:   -0.97964124  -0.944084550    -0.9591849  -0.97641231  -0.91727501  -0.93446956
3:   -0.93909905  -0.867065205    -0.8826669  -0.92443743  -0.83362556  -0.81289156
4:   -0.20279431   0.089712726    -0.3315601  -0.31913472   0.05604001  -0.27968675
5:    0.03822918   0.001549908    -0.2255745   0.02433084  -0.11296374  -0.29792789
6:   -0.40432178  -0.190976721    -0.4333497  -0.33742819   0.02176951   0.08595655
   fBodyAccJerkMeanX fBodyAccJerkMeanY fBodyAccJerkMeanZ fBodyAccJerkStdX
1:       -0.99463080       -0.98541870        -0.9907522       -0.9950738
2:       -0.98659702       -0.98157947        -0.9860531       -0.9874930
3:       -0.95707388       -0.92246261        -0.9480609       -0.9641607
4:       -0.17054696       -0.03522552        -0.4689992       -0.1335866
5:       -0.02766387       -0.12866716        -0.2883347       -0.0863279
6:       -0.47987525       -0.41344459        -0.6854744       -0.4619070
   fBodyAccJerkStdY fBodyAccJerkStdZ fBodyGyroMeanX fBodyGyroMeanY fBodyGyroMeanZ
1:       -0.9870182       -0.9923498     -0.9863868    -0.98898446    -0.98077312
2:       -0.9825139       -0.9883392     -0.9761615    -0.97583859    -0.95131554
3:       -0.9322179       -0.9605870     -0.8502492    -0.95219149    -0.90930272
4:        0.1067399       -0.5347134     -0.3390322    -0.10305942    -0.25594094
5:       -0.1345800       -0.4017215     -0.3524496    -0.05570225    -0.03186943
6:       -0.3817771       -0.7260402     -0.4926117    -0.31947461    -0.45359721
   fBodyGyroStdX fBodyGyroStdY fBodyGyroStdZ fBodyAccMagMean fBodyAccMagStd
1:    -0.9874971   -0.98710773    -0.9823453     -0.98535636     -0.9823138
2:    -0.9779042   -0.96234504    -0.9439178     -0.94778292     -0.9284448
3:    -0.8822965   -0.95123205    -0.9165825     -0.86176765     -0.7983009
4:    -0.5166919   -0.03350816    -0.4365622     -0.12862345     -0.3980326
5:    -0.4954225   -0.18141473    -0.2384436      0.09658453     -0.1865303
6:    -0.5658925    0.15153891    -0.5717078     -0.35239594     -0.4162601
   fBodyAccJerkMagMean fBodyAccJerkMagStd fBodyGyroMagMean fBodyGyroMagStd
1:         -0.99254248         -0.9925360       -0.9846176      -0.9784661
2:         -0.98526213         -0.9816062       -0.9584356      -0.9321984
3:         -0.93330036         -0.9218040       -0.8621902      -0.8243194
4:         -0.05711940         -0.1034924       -0.1992526      -0.3210180
5:          0.02621849         -0.1040523       -0.1857203      -0.3983504
6:         -0.44265216         -0.5330599       -0.3259615      -0.1829855
   fBodyGyroJerkMagMean fBodyGyroJerkMagStd
1:           -0.9948154          -0.9946711
2:           -0.9897975          -0.9870496
3:           -0.9423669          -0.9326607
4:           -0.3193086          -0.3816019
5:           -0.2819634          -0.3919199
6:           -0.6346651          -0.6939305
```


Summary of variables
--------------------


```r
summary(tidy.dataset)
```

```
                label       subject   
 WALKING           :30   1      :  6  
 WALKING_UPSTAIRS  :30   3      :  6  
 WALKING_DOWNSTAIRS:30   5      :  6  
 SITTING           :30   6      :  6  
 STANDING          :30   7      :  6  
 LAYING            :30   8      :  6  
                         (Other):144  
 tBodyAccMeanX    tBodyAccMeanY      
 Min.   :0.2216   Min.   :-0.040514  
 1st Qu.:0.2712   1st Qu.:-0.020022  
 Median :0.2770   Median :-0.017262  
 Mean   :0.2743   Mean   :-0.017876  
 3rd Qu.:0.2800   3rd Qu.:-0.014936  
 Max.   :0.3015   Max.   :-0.001308  
                                     
 tBodyAccMeanZ       tBodyAccStdX    
 Min.   :-0.15251   Min.   :-0.9961  
 1st Qu.:-0.11207   1st Qu.:-0.9799  
 Median :-0.10819   Median :-0.7526  
 Mean   :-0.10916   Mean   :-0.5577  
 3rd Qu.:-0.10443   3rd Qu.:-0.1984  
 Max.   :-0.07538   Max.   : 0.6269  
                                     
  tBodyAccStdY       tBodyAccStdZ    
 Min.   :-0.99024   Min.   :-0.9877  
 1st Qu.:-0.94205   1st Qu.:-0.9498  
 Median :-0.50897   Median :-0.6518  
 Mean   :-0.46046   Mean   :-0.5756  
 3rd Qu.:-0.03077   3rd Qu.:-0.2306  
 Max.   : 0.61694   Max.   : 0.6090  
                                     
 tGravityAccMeanX  tGravityAccMeanY  
 Min.   :-0.6800   Min.   :-0.47989  
 1st Qu.: 0.8376   1st Qu.:-0.23319  
 Median : 0.9208   Median :-0.12782  
 Mean   : 0.6975   Mean   :-0.01621  
 3rd Qu.: 0.9425   3rd Qu.: 0.08773  
 Max.   : 0.9745   Max.   : 0.95659  
                                     
 tGravityAccMeanZ   tGravityAccStdX  
 Min.   :-0.49509   Min.   :-0.9968  
 1st Qu.:-0.11726   1st Qu.:-0.9825  
 Median : 0.02384   Median :-0.9695  
 Mean   : 0.07413   Mean   :-0.9638  
 3rd Qu.: 0.14946   3rd Qu.:-0.9509  
 Max.   : 0.95787   Max.   :-0.8296  
                                     
 tGravityAccStdY   tGravityAccStdZ   tBodyAccJerkMeanX
 Min.   :-0.9942   Min.   :-0.9910   Min.   :0.04269  
 1st Qu.:-0.9711   1st Qu.:-0.9605   1st Qu.:0.07396  
 Median :-0.9590   Median :-0.9450   Median :0.07640  
 Mean   :-0.9524   Mean   :-0.9364   Mean   :0.07947  
 3rd Qu.:-0.9370   3rd Qu.:-0.9180   3rd Qu.:0.08330  
 Max.   :-0.6436   Max.   :-0.6102   Max.   :0.13019  
                                                      
 tBodyAccJerkMeanY    tBodyAccJerkMeanZ  
 Min.   :-0.0386872   Min.   :-0.067458  
 1st Qu.: 0.0004664   1st Qu.:-0.010601  
 Median : 0.0094698   Median :-0.003861  
 Mean   : 0.0075652   Mean   :-0.004953  
 3rd Qu.: 0.0134008   3rd Qu.: 0.001958  
 Max.   : 0.0568186   Max.   : 0.038053  
                                         
 tBodyAccJerkStdX  tBodyAccJerkStdY 
 Min.   :-0.9946   Min.   :-0.9895  
 1st Qu.:-0.9832   1st Qu.:-0.9724  
 Median :-0.8104   Median :-0.7756  
 Mean   :-0.5949   Mean   :-0.5654  
 3rd Qu.:-0.2233   3rd Qu.:-0.1483  
 Max.   : 0.5443   Max.   : 0.3553  
                                    
 tBodyAccJerkStdZ   tBodyGyroMeanX    
 Min.   :-0.99329   Min.   :-0.20578  
 1st Qu.:-0.98266   1st Qu.:-0.04712  
 Median :-0.88366   Median :-0.02871  
 Mean   :-0.73596   Mean   :-0.03244  
 3rd Qu.:-0.51212   3rd Qu.:-0.01676  
 Max.   : 0.03102   Max.   : 0.19270  
                                      
 tBodyGyroMeanY     tBodyGyroMeanZ    
 Min.   :-0.20421   Min.   :-0.07245  
 1st Qu.:-0.08955   1st Qu.: 0.07475  
 Median :-0.07318   Median : 0.08512  
 Mean   :-0.07426   Mean   : 0.08744  
 3rd Qu.:-0.06113   3rd Qu.: 0.10177  
 Max.   : 0.02747   Max.   : 0.17910  
                                      
 tBodyGyroStdX     tBodyGyroStdY     tBodyGyroStdZ    
 Min.   :-0.9943   Min.   :-0.9942   Min.   :-0.9855  
 1st Qu.:-0.9735   1st Qu.:-0.9629   1st Qu.:-0.9609  
 Median :-0.7890   Median :-0.8017   Median :-0.8010  
 Mean   :-0.6916   Mean   :-0.6533   Mean   :-0.6164  
 3rd Qu.:-0.4414   3rd Qu.:-0.4196   3rd Qu.:-0.3106  
 Max.   : 0.2677   Max.   : 0.4765   Max.   : 0.5649  
                                                      
 tBodyGyroJerkMeanX tBodyGyroJerkMeanY
 Min.   :-0.15721   Min.   :-0.07681  
 1st Qu.:-0.10322   1st Qu.:-0.04552  
 Median :-0.09868   Median :-0.04112  
 Mean   :-0.09606   Mean   :-0.04269  
 3rd Qu.:-0.09110   3rd Qu.:-0.03842  
 Max.   :-0.02209   Max.   :-0.01320  
                                      
 tBodyGyroJerkMeanZ  tBodyGyroJerkStdX
 Min.   :-0.092500   Min.   :-0.9965  
 1st Qu.:-0.061725   1st Qu.:-0.9800  
 Median :-0.053430   Median :-0.8396  
 Mean   :-0.054802   Mean   :-0.7036  
 3rd Qu.:-0.048985   3rd Qu.:-0.4629  
 Max.   :-0.006941   Max.   : 0.1791  
                                      
 tBodyGyroJerkStdY tBodyGyroJerkStdZ tBodyAccMagMean  
 Min.   :-0.9971   Min.   :-0.9954   Min.   :-0.9865  
 1st Qu.:-0.9832   1st Qu.:-0.9848   1st Qu.:-0.9573  
 Median :-0.8942   Median :-0.8610   Median :-0.4829  
 Mean   :-0.7636   Mean   :-0.7096   Mean   :-0.4973  
 3rd Qu.:-0.5861   3rd Qu.:-0.4741   3rd Qu.:-0.0919  
 Max.   : 0.2959   Max.   : 0.1932   Max.   : 0.6446  
                                                      
 tBodyAccMagStd    tGravityAccMagMean
 Min.   :-0.9865   Min.   :-0.9865   
 1st Qu.:-0.9430   1st Qu.:-0.9573   
 Median :-0.6074   Median :-0.4829   
 Mean   :-0.5439   Mean   :-0.4973   
 3rd Qu.:-0.2090   3rd Qu.:-0.0919   
 Max.   : 0.4284   Max.   : 0.6446   
                                     
 tGravityAccMagStd tBodyAccJerkMagMean
 Min.   :-0.9865   Min.   :-0.9928    
 1st Qu.:-0.9430   1st Qu.:-0.9807    
 Median :-0.6074   Median :-0.8168    
 Mean   :-0.5439   Mean   :-0.6079    
 3rd Qu.:-0.2090   3rd Qu.:-0.2456    
 Max.   : 0.4284   Max.   : 0.4345    
                                      
 tBodyAccJerkMagStd tBodyGyroMagMean 
 Min.   :-0.9946    Min.   :-0.9807  
 1st Qu.:-0.9765    1st Qu.:-0.9461  
 Median :-0.8014    Median :-0.6551  
 Mean   :-0.5842    Mean   :-0.5652  
 3rd Qu.:-0.2173    3rd Qu.:-0.2159  
 Max.   : 0.4506    Max.   : 0.4180  
                                     
 tBodyGyroMagStd   tBodyGyroJerkMagMean
 Min.   :-0.9814   Min.   :-0.99732    
 1st Qu.:-0.9476   1st Qu.:-0.98515    
 Median :-0.7420   Median :-0.86479    
 Mean   :-0.6304   Mean   :-0.73637    
 3rd Qu.:-0.3602   3rd Qu.:-0.51186    
 Max.   : 0.3000   Max.   : 0.08758    
                                       
 tBodyGyroJerkMagStd fBodyAccMeanX    
 Min.   :-0.9977     Min.   :-0.9952  
 1st Qu.:-0.9805     1st Qu.:-0.9787  
 Median :-0.8809     Median :-0.7691  
 Mean   :-0.7550     Mean   :-0.5758  
 3rd Qu.:-0.5767     3rd Qu.:-0.2174  
 Max.   : 0.2502     Max.   : 0.5370  
                                      
 fBodyAccMeanY      fBodyAccMeanZ    
 Min.   :-0.98903   Min.   :-0.9895  
 1st Qu.:-0.95361   1st Qu.:-0.9619  
 Median :-0.59498   Median :-0.7236  
 Mean   :-0.48873   Mean   :-0.6297  
 3rd Qu.:-0.06341   3rd Qu.:-0.3183  
 Max.   : 0.52419   Max.   : 0.2807  
                                     
  fBodyAccStdX      fBodyAccStdY     
 Min.   :-0.9966   Min.   :-0.99068  
 1st Qu.:-0.9820   1st Qu.:-0.94042  
 Median :-0.7470   Median :-0.51338  
 Mean   :-0.5522   Mean   :-0.48148  
 3rd Qu.:-0.1966   3rd Qu.:-0.07913  
 Max.   : 0.6585   Max.   : 0.56019  
                                     
  fBodyAccStdZ     fBodyAccJerkMeanX fBodyAccJerkMeanY
 Min.   :-0.9872   Min.   :-0.9946   Min.   :-0.9894  
 1st Qu.:-0.9459   1st Qu.:-0.9828   1st Qu.:-0.9725  
 Median :-0.6441   Median :-0.8126   Median :-0.7817  
 Mean   :-0.5824   Mean   :-0.6139   Mean   :-0.5882  
 3rd Qu.:-0.2655   3rd Qu.:-0.2820   3rd Qu.:-0.1963  
 Max.   : 0.6871   Max.   : 0.4743   Max.   : 0.2767  
                                                      
 fBodyAccJerkMeanZ fBodyAccJerkStdX  fBodyAccJerkStdY 
 Min.   :-0.9920   Min.   :-0.9951   Min.   :-0.9905  
 1st Qu.:-0.9796   1st Qu.:-0.9847   1st Qu.:-0.9737  
 Median :-0.8707   Median :-0.8254   Median :-0.7852  
 Mean   :-0.7144   Mean   :-0.6121   Mean   :-0.5707  
 3rd Qu.:-0.4697   3rd Qu.:-0.2475   3rd Qu.:-0.1685  
 Max.   : 0.1578   Max.   : 0.4768   Max.   : 0.3498  
                                                      
 fBodyAccJerkStdZ    fBodyGyroMeanX   
 Min.   :-0.993108   Min.   :-0.9931  
 1st Qu.:-0.983747   1st Qu.:-0.9697  
 Median :-0.895121   Median :-0.7300  
 Mean   :-0.756489   Mean   :-0.6367  
 3rd Qu.:-0.543787   3rd Qu.:-0.3387  
 Max.   :-0.006236   Max.   : 0.4750  
                                      
 fBodyGyroMeanY    fBodyGyroMeanZ    fBodyGyroStdX    
 Min.   :-0.9940   Min.   :-0.9860   Min.   :-0.9947  
 1st Qu.:-0.9700   1st Qu.:-0.9624   1st Qu.:-0.9750  
 Median :-0.8141   Median :-0.7909   Median :-0.8086  
 Mean   :-0.6767   Mean   :-0.6044   Mean   :-0.7110  
 3rd Qu.:-0.4458   3rd Qu.:-0.2635   3rd Qu.:-0.4813  
 Max.   : 0.3288   Max.   : 0.4924   Max.   : 0.1966  
                                                      
 fBodyGyroStdY     fBodyGyroStdZ     fBodyAccMagMean  
 Min.   :-0.9944   Min.   :-0.9867   Min.   :-0.9868  
 1st Qu.:-0.9602   1st Qu.:-0.9643   1st Qu.:-0.9560  
 Median :-0.7964   Median :-0.8224   Median :-0.6703  
 Mean   :-0.6454   Mean   :-0.6577   Mean   :-0.5365  
 3rd Qu.:-0.4154   3rd Qu.:-0.3916   3rd Qu.:-0.1622  
 Max.   : 0.6462   Max.   : 0.5225   Max.   : 0.5866  
                                                      
 fBodyAccMagStd    fBodyAccJerkMagMean
 Min.   :-0.9876   Min.   :-0.9940    
 1st Qu.:-0.9452   1st Qu.:-0.9770    
 Median :-0.6513   Median :-0.7940    
 Mean   :-0.6210   Mean   :-0.5756    
 3rd Qu.:-0.3654   3rd Qu.:-0.1872    
 Max.   : 0.1787   Max.   : 0.5384    
                                      
 fBodyAccJerkMagStd fBodyGyroMagMean 
 Min.   :-0.9944    Min.   :-0.9865  
 1st Qu.:-0.9752    1st Qu.:-0.9616  
 Median :-0.8126    Median :-0.7657  
 Mean   :-0.5992    Mean   :-0.6671  
 3rd Qu.:-0.2668    3rd Qu.:-0.4087  
 Max.   : 0.3163    Max.   : 0.2040  
                                     
 fBodyGyroMagStd   fBodyGyroJerkMagMean
 Min.   :-0.9815   Min.   :-0.9976     
 1st Qu.:-0.9488   1st Qu.:-0.9813     
 Median :-0.7727   Median :-0.8779     
 Mean   :-0.6723   Mean   :-0.7564     
 3rd Qu.:-0.4277   3rd Qu.:-0.5831     
 Max.   : 0.2367   Max.   : 0.1466     
                                       
 fBodyGyroJerkMagStd
 Min.   :-0.9976    
 1st Qu.:-0.9802    
 Median :-0.8941    
 Mean   :-0.7715    
 3rd Qu.:-0.6081    
 Max.   : 0.2878 
```


Save to file
------------

Save data table objects to a tab-delimited text file called `TidyDataset.txt`.


```r
f <- file.path("TidyDataset.txt")
write.table(tidy.dataset, f, quote = FALSE, sep = "\t", row.names = FALSE)
```