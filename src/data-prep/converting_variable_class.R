###-- CONVERTING VARIABLES --###


#-Convert the N/As and whitespaces into missing values
listings_merged[ listings_merged == "N/A" ] <- NA
listings_merged[ listings_merged == ""] <- NA

#-Detect rows with missing values
str(listings_merged)
complete.cases(listings_merged)

#-Remove missing values
listings_merged <- listings_merged[complete.cases(listings_merged), ]