###-- DATA MANIPULATION WITH DPLYR --###


#-Creating dummy variable for host_response_time
#-Base level for the dummy variable: response_within_a_few_days 
listings_merged$within_hour_resp <- ifelse(listings_merged$host_response_time == "within an hour", 1, 0)
listings_merged$within_fewhours_resp <- ifelse(listings_merged$host_response_time == "within a few hours", 1, 0) 
listings_merged$within_day_resp <- ifelse(listings_merged$host_response_time == "within a day", 1, 0)

#-Aggregate and summarize: we group by hosts and then create a new variable that puts the total number of reviews per host. and the average
agg_response_time <- listings_merged %>% group_by(host_id) %>%
  summarize(within_hour_response = mean(within_hour_resp), within_few_hours_response = mean(within_fewhours_resp), within_day_response = mean(within_day_resp))
agg_booked_no <- listings_merged %>% group_by(host_id) %>% summarize(booked_no = sum(booked_number))
agg_tot_number <- listings_merged %>% group_by(host_id) %>% summarize(total = sum(n))

#-Transform text to numeric so to aggregate host_response_time
#-Creating a copy data frame to make the transformation  
temp_listings_merged <- listings_merged
temp_listings_merged$host_response_time[(temp_listings_merged$host_response_time) == "within an hour"] <- 1
temp_listings_merged$host_response_time[(temp_listings_merged$host_response_time) == "within a few hours"] <- 2
temp_listings_merged$host_response_time[(temp_listings_merged$host_response_time) == "within a day"] <- 3
temp_listings_merged$host_response_time[(temp_listings_merged$host_response_time) == "a few days or more"] <- 4

#-Load packages
install.packages("tibble")
install.packages("hablar")
library(tibble)
library(hablar)

#-Convert the variable to numeric
temp_listings_merged <- temp_listings_merged %>% convert(num(host_response_time))
agg_host_response_time <- temp_listings_merged %>% group_by(host_id) %>% summarize(response_time = mean(host_response_time))

#-Combine them with inner join
final_listings_venice <- agg_response_time %>%
  inner_join(agg_booked_no, by = c("host_id" = "host_id")) %>%
  inner_join(agg_tot_number, by = c("host_id" = "host_id")) %>%
  inner_join(agg_host_response_time, by = c("host_id" = "host_id"))

#-Convert back to text
final_listings_venice$response_time[(final_listings_venice$response_time) == 1] <- "within an hour"
final_listings_venice$response_time[(final_listings_venice$response_time) == 2] <- "within a few hours"
final_listings_venice$response_time[(final_listings_venice$response_time) == 3] <- "within a day"
final_listings_venice$response_time[(final_listings_venice$response_time) == 4] <- "a few days or more"

#-Create percentage of bookings
final_listings_venice$booked_percent <- ((final_listings_venice$booked_no)/(final_listings_venice$total))*100

#-Data frame ready for viewing
View(final_listings_venice)

#-Create an output file and save the final data frame as csv
dir.create("output/")
write.csv(final_listings_venice,"output/final_listings_venice.csv")

#-Load packages
install.packages("writexl")
library("writexl")

#-Save as Excel
write_xlsx(final_listings_venice, "output/final_listings_venice.xlsx")
