# 2.
# Read datasets:

hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

# Open dplyr, needed later
library(dplyr)
# 3.
str(hd)
str(gii)
dim(hd)
# 195   8 dimensional
dim(gii)
# 195  10 dimensional
summary(hd)
summary(gii)

# 4.
# Change the names of variables to more convinient form. I want to make sure, that 
# the column names are still easy to interpret, and therefore I won't change much
# some of the names.
names(hd)
colnames(hd)<- c("HDI.Rank" ,"Country","HDI",  "Life.Expectancy", "Expected.Education"
                 ,"Education" , "GNI.cap", "GNI.cap.minus.HDI.Rank"  )
names(gii)
colnames(gii) <- c("GII.Rank", "Country", "GII", "MMR", "ABR", 
                   "PR", "SE.Female", "SE.Male", "LFPR.Female", "LFPR.Male" )

# 5.
# Secondary education ratio, with females / males
se.ratio <- gii$SE.Female / gii$SE.Male
# Add as new column to gii
gii <- cbind(gii, se.ratio)

# labour force participation of females and males
LFPR.ratio <- gii$LFPR.Female / gii$LFPR.Male
gii$LFPR.ratio <- LFPR.ratio

head(gii)

# Everything seems to work!

# 6.
join_by <- c("Country")
human <- inner_join(gii, hd, by = join_by)
dim(human)
# Dimensions 195 19

#Save the data

write.table(human, "human.txt")
