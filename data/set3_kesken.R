# Usva Topo
# 14.11.2018
# The data measures secondary education achievements in two Portugese schools. 
# data source: https://archive.ics.uci.edu/ml/machine-learning-databases/00320/

# 3.
# Read both data sets:
url_mat <- read.csv("data/student-mat.csv", sep = ";", header = TRUE)
url_por <- read.csv("data/student-por.csv", sep = ";", header = TRUE)

# 4. Join data sets
# Open dplyr for combining datasets:
library(dplyr)

# select the variables for joining the data sets:
join_by <- c("school", "sex", "age", "address", "famsize", "Pstatus", "Medu", "Fedu", "Mjob", "Fjob", "reason", "nursery","internet")

# Join the two datasets with the identifiers. Suffix ads .math and .por to variables, that are from another dataset.
math_por <- inner_join(url_mat, url_por, by = join_by, suffix = c(".math", ".por"))

# Take a look at the data:
dim(math_por)
# 382 obeservations and 53 rows.
colnames(math_por)
# Check the names of the variables. If the variable is from mat-data, it has a sign .mat in the end, .por if from the other dataset.

glimpse(math_por)
# 382 observations and 53 variables. Variables are factors or initials.

#5. If-else structure:


# create a new data frame with only the joined columns
alc <- select(math_por, one_of(join_by))

# columns that were not used for joining the data
notjoined_columns <- colnames(url_mat)[!colnames(url_mat) %in% join_by]

# print out the columns not used for joining
notjoined_columns

# for every column name not used for joining...
for(column_name in notjoined_columns) {
  # select two columns from 'math_por' with the same original name
  two_columns <- select(math_por, starts_with(column_name))
  # select the first column vector of those two columns
  first_column <- select(two_columns, 1)[[1]]
  
  # if that first column  vector is numeric...
  if(is.numeric(first_column)) {
    # take a rounded average of each row of the two columns and
    # add the resulting vector to the alc data frame
    alc[column_name] <- round(rowMeans(two_columns))
  } else { # else if it's not numeric...
    # add the first column vector to the alc data frame
    alc[column_name] <- first_column
  }
}

# glimpse at the new combined data
glimpse(alc)
# Now only 33 variables left

#6. 
