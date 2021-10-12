### DATA MANIPULATION WITH DPLYR

library(tidyverse)
library(dplyr)

# Creating dummy variable for host_response_time on whether the response is within an hour:
listings_merged %>% count(host_response_time)
listings_merged$very_fast_resp <- ifelse(listings_merged$host_response_time == "within an hour", 1, 0)   

# Aggregate and summarize: we group by hosts and then create a new variable that puts the total number of reviews per host. and the average
agg_response_time <- listings_merged %>% group_by(host_id) %>% summarize(very_fast_response = mean(very_fast_resp))
agg_reviews <- listings_merged %>% group_by(host_id) %>% summarize(reviews_number = sum(number_of_reviews))
agg_response_rate <- listings_merged %>% group_by(host_id) %>% summarize(response_rate = mean(host_response_rate))
agg_review_ratings <- listings_merged %>% group_by(host_id) %>% summarize(avg_review_rating = mean(review_scores_rating))
agg_booked_number <- listings_merged %>% group_by(host_id) %>% summarize(booked_no = sum(booked_number))
agg_tot_number <- listings_merged %>% group_by(host_id) %>% summarize(total = sum(n))

# Combine them with inner join:
final_listings_venice <- agg_response_time %>%
  inner_join(agg_response_rate, by = c("host_id" = "host_id")) %>%
  inner_join(agg_review_ratings, by = c("host_id" = "host_id")) %>%
  inner_join(agg_reviews, by = c("host_id" = "host_id")) %>%
  inner_join(agg_booked_number, by = c("host_id" = "host_id")) %>%
  inner_join(agg_tot_number, by = c("host_id" = "host_id"))

View(final_listings_venice)

# create percentage of bookings:
final_listings_venice$booked_percent <- ((final_listings_venice$booked_no)/(final_listings_venice$total))*100
