# Removing unwanted columns from listings_venice
listings_venice = subset(listings_venice, select = (-c(property_type, host_acceptance_rate, host_total_listings_count, reviews_per_month, listing_url, scrape_id, last_scraped, description, neighborhood_overview, picture_url, host_url, host_name, host_since, host_location, host_about, host_thumbnail_url, host_picture_url, host_neighbourhood, host_verifications, host_has_profile_pic, host_identity_verified, neighbourhood, neighbourhood_cleansed, neighbourhood_group_cleansed, latitude, longitude, amenities, minimum_minimum_nights, maximum_minimum_nights, minimum_maximum_nights, maximum_maximum_nights, minimum_nights_avg_ntm, maximum_nights_avg_ntm, calendar_updated,
                                                       host_listings_count, bathrooms, availability_30, availability_60, availability_90, availability_365, calendar_last_scraped, number_of_reviews_ltm, number_of_reviews_l30d, first_review, last_review, review_scores_cleanliness, review_scores_checkin, review_scores_communication, review_scores_location, review_scores_value, license, host_is_superhost, review_scores_accuracy, calculated_host_listings_count_entire_homes, calculated_host_listings_count_private_rooms, calculated_host_listings_count_shared_rooms, name, accommodates, bathrooms_text,
                                                       bedrooms, beds, calculated_host_listings_count, has_availability, instant_bookable, price, minimum_nights, maximum_nights, room_type)))

#Removing columns from calendar_venice that are not relevant
calendar_venice = subset(calendar_venice, select = (-c(date, price, adjusted_price, minimum_nights, maximum_nights)))

#for calendar aggregation merge:
# Create dummy on whether it is booked:
calendar_venice$booked <- ifelse(calendar_venice$available == "f", 1, 0)
agg_number <- calendar_venice %>% group_by(listing_id) %>% count(listing_id)
agg_booked <- calendar_venice %>% group_by(listing_id) %>% summarize(booked_number = sum(booked))

# merge both:
final_calendar_venice <- agg_booked %>% inner_join(agg_number, by = c("listing_id" = "listing_id"))

#merge calendar to listings df:
listings_merged <- listings_venice %>% inner_join(final_calendar_venice, by = c("id" = "listing_id"))
View(listings_merged)
