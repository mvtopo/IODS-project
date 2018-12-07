# For exercise 3:
library(dplyr)
library(tidyr)

# 1.
#Read data:

BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", header = TRUE)
RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", header = TRUE)

# Check how the data looks like

summary(BPRS)
summary(RATS)
str(BPRS)
str(RATS)
dim(BPRS)
dim(RATS)

# The observations per certain week are set as their own variables. This is not practical for our uses. This is why
# we want to convert the data from wide form to long form.

# 2.

# Categorical variables to factors: 

BPRS$treatment <- factor(BPRS$treatment)
BPRS$subject <- factor(BPRS$subject)

RATS$ID <- factor(RATS$ID)
RATS$Group <- factor(RATS$Group)

# Double-check

str(BPRS)
str(RATS)

# The variables were changed to factors

# 3.  Convert the data sets to long form:

BPRSL <- BPRS %>% gather(key = weeks, value= bprs, -treatment, -subject )
RATSL <- RATS %>% gather(key = WD, value = rats, -ID, -Group) %>%
  mutate(Time = as.integer(substr(WD,3,4))) 

# Extract week number
RATSL <- RATS %>%
  gather(key = WD, value = Weight, -ID, -Group) %>%
  mutate(Time = as.integer(substr(WD,3,4))) 

# 4. Serious look:
str(RATS)
str(RATSL)

str(BPRS)
str(BPRSL)

dim(RATS)
dim(RATSL)

dim(BPRS)
dim(BPRSL)

summary(RATS)
summary(RATSL)

summary(BPRS)
summary(BPRSL)

glimpse(RATS)
glimpse(RATSL)

glimpse(BPRS)
glimpse(BPRSL)

# Weeks are now as one variable among the other variables, instead of a huge list of variables. Now we have also 
# named values bprs and weight, making it easier to interpret the data.


# Save these as files:
write.table(BPRSL, "BPRSL.txt")
write.table(RATSL, "RATSL.txt")