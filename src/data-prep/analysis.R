# Analysis

#ANOVA ON WHETHER Number of REVIEWS AFFECTs RATINGS:
nnumbers_on_rating_aov <- lm(review_rating ~ reviews_number, final_listings_venice)
anova(nnumbers_on_rating_aov)
summary(nnumbers_on_rating_aov)

#host response time affects rating?
response_aov <- lm(review_rating ~ very_fast_response+fast_response+average_response*slow_response, final_listings_venice)
anova(response_aov)
summary(response_aov)
