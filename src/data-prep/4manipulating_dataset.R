library(tidyverse)
library(dplyr)

#creating dummy variables for host_response_time:
listings_venice %>% count(host_response_time)
#  host_response_time     n
#<chr>              <int>
#1 a few days or more    82 set to 4
#2 within a day         201 set to 3
#3 within a few hours   309 set to 2
#4 within an hour      3278 set to 1
#5 NA                   724 
listings_venice$very_fast_resp <- ifelse(listings_venice$host_response_time == "within an hour", 1, 0)
listings_venice$fast_resp <- ifelse(listings_venice$host_response_time == "within a few hours", 1, 0)                                       
listings_venice$average_resp <- ifelse(listings_venice$host_response_time == "within a day", 1, 0)
listings_venice$slow_resp <- ifelse(listings_venice$host_response_time == "a few days or more", 1, 0)

# DATA MANIPULATION WITH DPLYR

#aggregate and summarize: we group by hosts and then create a new variable that puts the total number of reviews per host. and the average
agg_reviews <- listings_venice %>% group_by(host_id) %>% summarize(reviews_number = sum(number_of_reviews))
agg_response_rate <- listings_venice %>% group_by(host_id) %>% summarize(response_rate = mean(host_response_rate))
agg_review_ratings <- listings_venice %>% group_by(host_id) %>% summarize(review_rating = mean(review_scores_rating))
agg_response_time <- listings_venice %>% group_by(host_id) %>% summarize(very_fast_response = mean(very_fast_resp), fast_response = mean(fast_resp), average_response = mean(average_resp), slow_response = mean(slow_resp))

#Check that we have the same observations everywhere:
View(agg_reviews)
View(agg_response_rate)
View(agg_review_ratings)
View(agg_response_time)

#Combine them with inner join:
final_listings_venice <- agg_response_time %>% inner_join(agg_response_rate, by = c("host_id" = "host_id")) %>%
  inner_join(agg_review_ratings, by = c("host_id" = "host_id")) %>%
  inner_join(agg_reviews, by = c("host_id" = "host_id"))

View(final_listings_venice)

