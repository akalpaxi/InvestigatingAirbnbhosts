### ANALYSIS
install.packages(broom)
library(broom)

ggplot(final_listings_venice, aes(x=response_rate, y=review_rating*20)) + geom_point() #we wanna see that in a scale 100X100
ggplot(final_listings_venice, aes(x=very_fast_response, y=review_rating)) + geom_histogram() #we wanna see that in a scale 100X100
#ANOVA ON WHETHER Number of REVIEWS AFFECTs RATINGS:
aov <- lm(review_scores_rating ~ host_response_time, listings_venice)
anova(aov)
summary(aov)
ggplot(listings_venice, aes(x=host_response_time, y=review_scores_rating)) + geom_point()

aov2 <- lm(review_rating ~ response_rate, final_listings_venice)
anova(aov2)
summary(aov2)
ggplot(final_listings_venice, aes(x=response_rate, y=review_rating)) + geom_point()
hist(final_listings_venice$response_rate)
hist(final_listings_venice$)

#host response time affects rating?
response_aov <- lm(review_rating ~ very_fast_response+fast_response+average_response, clean_listings_venice)
anova(response_aov)
summary(response_aov)
