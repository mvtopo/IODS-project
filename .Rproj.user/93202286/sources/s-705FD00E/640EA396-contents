# Usva Topo
# 6.11.2018
# This file is the R-script for "Regression and model validation" exercises.

#2.
# Open the data
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep= "\t", header = TRUE)

# Dimensions of data
dim(lrn14)
# The data is (183, 60) dimensional.

# Structure of the data
str(lrn14)
#  Gender is a factor with levels "F" (1) and "M" (2). Other variables are integers. 
# Variables from Aa to Dj are the values of 1 to 5 (likert), describing students answers to the survey.

#3.
# Open dplyr for filter() command:

library(dplyr)

# The questions:
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

# Exclude observations where the exam points variable is zero.
lrn14 <- filter(lrn14, Points > 0) 

# select the columns related to deep learning and create column 'deep' by averaging
deep_columns <- select(lrn14, one_of(deep_questions))
lrn14$deep <- rowMeans(deep_columns)

# select the columns related to surface learning and create column 'surf' by averaging
surface_columns <- select(lrn14, one_of(surface_questions))
lrn14$surf <- rowMeans(surface_columns)

# select the columns related to strategic learning and create column 'stra' by averaging
strategic_columns <- select(lrn14, one_of(strategic_questions))
lrn14$stra <- rowMeans(strategic_columns)

#Create an analysis dataset with the variables gender, age, attitude, deep, stra, surf
# and points by combining questions

# choose a handful of columns to keep
keep_columns <- c("gender","Age","Attitude", "deep", "stra", "surf", "Points")
learning2014 <- select(lrn14, one_of(keep_columns))

#4.
# Save as txt:
write.table(learning2014, file="learning2014.txt")
# Check that all is okay with the txt-file
learning2014txt <- read.table("learning2014.txt")
head(learning2014txt)
str(learning2014txt)
# The text file contains seven variables gender, Age, Attitude, deep, stra, surf and points.
# Variables have the correct type (i.e. gender as factor, age as initial...)
