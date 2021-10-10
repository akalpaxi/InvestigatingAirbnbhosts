# Check for format:
class(calendar_venice$date)

# Convert to date:
calendar_venice$date <- as.Date(calendar_venice$date, format = "%Y-%m-%d")


# Detect and Remove % sign from the dataset:
library(tidyverse)
str_detect(listings_venice$host_response_rate, "%")
listings_venice$host_response_rate <- listings_venice$host_response_rate %>% str_remove_all("%")
listings_venice$host_acceptance_rate <- listings_venice$host_acceptance_rate %>% str_remove_all("%")

# Now we will check the values without %:
listings_venice %>% count(host_response_rate, sort = TRUE)
listings_venice %>% count(host_acceptance_rate, sort = TRUE)
listings_venice %>% count(host_response_time, sort = TRUE)
listings_venice %>% count(host_total_listings_count, sort = TRUE)

# We have to convert the N/A and blanc into missing values:

listings_venice[ listings_venice == "N/A" ] <- NA
listings_venice[ listings_venice == " "] <- NA

# Convert to numeric:
listings_venice$host_repsponse_rate <- as.numeric(listings_venice$host_repsponse_rate)
listings_venice$host_acceptance_rate <- as.numeric(listings_venice$host_acceptance_rate)
