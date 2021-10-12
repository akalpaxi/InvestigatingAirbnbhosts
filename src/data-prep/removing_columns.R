# Removing unwanted columns from listings_venice
listings_venice = subset(listings_venice, select = (-c(host_acceptance_rate, host_total_listings_count, reviews_per_month, listing_url, scrape_id, last_scraped, description, neighborhood_overview, picture_url, host_url, host_name, host_since, host_location, host_about, host_thumbnail_url, host_picture_url, host_neighbourhood, host_verifications, host_has_profile_pic, host_identity_verified, neighbourhood, neighbourhood_cleansed, neighbourhood_group_cleansed, latitude, longitude, amenities, minimum_minimum_nights, maximum_minimum_nights, minimum_maximum_nights, maximum_maximum_nights, minimum_nights_avg_ntm, maximum_nights_avg_ntm, calendar_updated,
                                                       host_listings_count, bathrooms, availability_30, availability_60, availability_90, availability_365, calendar_last_scraped, number_of_reviews_ltm, number_of_reviews_l30d, first_review, last_review, review_scores_cleanliness, review_scores_checkin, review_scores_communication, review_scores_location, review_scores_value, license, host_is_superhost, review_scores_accuracy, calculated_host_listings_count_entire_homes, calculated_host_listings_count_private_rooms, calculated_host_listings_count_shared_rooms, name, accommodates, bathrooms_text,
                                                       bedrooms, beds, property_type, calculated_host_listings_count, has_availability, instant_bookable, price, minimum_nights, maximum_nights, room_type)))

#Check the dataset listings_venice
View(listings_venice)
ncol(listings_venice)

#Removing columns from calendar_venice that are not relevant
calendar_venice = subset(calendar_venice, select = (-c(price, adjusted_price, minimum_nights, maximum_nights)))

#Check caledar_venice
View(calendar_venice)
ncol(calendar_venice)

#Load package dplyr 
install.packages("dplyr")
library(dplyr)

#Sort data
listings_venice %>% count(id, sort = TRUE)
calendar_venice %>% count(listing_id, sort = TRUE)
listings_venice %>% count(host_response_time, sort = TRUE)
listings_venice %>% count(host_id, sort = TRUE)

listings_venice %>% count(room_type, sort = TRUE)
#room_type    n
#1 Entire home/apt 5847
#2    Private room 1809
#3      Hotel room  258
#4     Shared room   33

calendar_venice %>% count(available, sort = TRUE)
#available       n
#1         t 1748035
#2         f 1152332
