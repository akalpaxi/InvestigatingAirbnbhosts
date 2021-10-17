###-- CONVERTING VARIABLES --###

#-Calling object listings_merged
listings_merged <- read.csv('temp/listings_merged.csv')

#-Convert the N/As and whitespaces into missing values
listings_merged[ listings_merged == "N/A" ] <- NA
listings_merged[ listings_merged == ""] <- NA

#-Detect rows with missing values
str(listings_merged)
complete.cases(listings_merged)

#-Remove missing values
listings_merged_clean <- listings_merged[complete.cases(listings_merged), ]
write.csv(listings_merged_clean,"temp/listings_merged_clean.csv")