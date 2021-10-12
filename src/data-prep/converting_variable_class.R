### CONVERTING VARIABLES

# Load package dplyr 
install.packages("dplyr")
library(dplyr)

# Detect and Remove % sign from the dataset:
library(tidyverse)
str_detect(listings_venice$host_response_rate, "%")
listings_merged$host_response_rate <- listings_merged$host_response_rate %>% str_remove_all("%")

# Check the values without %:
listings_merged %>% count(host_response_rate, sort = TRUE)

# Convert the N/A and blanc into missing values:
listings_merged[ listings_merged == "N/A" ] <- NA
listings_merged[ listings_merged == ""] <- NA
# Remove rows with missing values:
str(listings_merged)
complete.cases(listings_merged)
listings_merged <- listings_merged[complete.cases(listings_merged), ]
View(listings_merged)

# Convert to numeric:
install.packages("hablar")
library(tibble)
library(hablar)

listings_merged <- listings_merged %>% convert(num(host_response_rate))






