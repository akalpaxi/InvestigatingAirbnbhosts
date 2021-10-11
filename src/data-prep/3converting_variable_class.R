# Check for format:
class(calendar_venice$date)

# Convert to date:
calendar_venice$date <- as.Date(calendar_venice$date, format = "%Y-%m-%d")


# Detect and Remove % sign from the dataset:
library(tidyverse)
str_detect(listings_venice$host_response_rate, "%")
listings_venice$host_response_rate <- listings_venice$host_response_rate %>% str_remove_all("%")

# Now we will check the values without %:
listings_venice %>% count(host_response_rate, sort = TRUE)

# We have to convert the N/A and blanc into missing values:
listings_venice[ listings_venice == "N/A" ] <- NA
listings_venice[ listings_venice == ""] <- NA

# Convert to numeric:
library(tidyverse)
install.packages("hablar")
library(tibble)
library(hablar)

listings_venice <- listings_venice %>% convert(num(host_response_rate))

#we want to see if the reviews are between the range of 0-5:
summary(listings_venice$review_scores_rating)

#How many reviews should we keep???
# the median n of reviews is 18 and the mean is 56.88
library(ggplot2)
# we will visualize the number of reviews compared to the reviews ratings for the reason that in a smaller amount of reviews a positive/negative rating has more impact than in a larger number of reviews.
ggplot(listings_venice, aes(number_of_reviews, review_scores_rating)) + geom_point() # THIS IS NOT really helpful so we gonna make a new df just to visualize better:
ideal_n_of_reviews <- listings_venice %>% filter(number_of_reviews < 100)
ggplot(ideal_n_of_reviews, aes(number_of_reviews, review_scores_rating)) + geom_point()
# according to the plot we can see that a min of 10 reviews can satisfy this effect. 

#We want to examine the reviews rating and in order to do that we set a min of 10 reviews:

listings_venice <- listings_venice %>% filter(number_of_reviews >= 10)



