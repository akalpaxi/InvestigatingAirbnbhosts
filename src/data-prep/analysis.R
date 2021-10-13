###-- ANALYSIS --###


library(broom)
library(ggplot2)

# --- Regression Analysis --- #

#-Calling object final_listings_venice
final_listings_venice <- read.csv('output/final_listings_venice.csv')

#We want to investigate the effect of host response time on booked percent
#The independent variables in the model are the dummy variables (within_hour_response, within_few_hours_response, within_day_response) and the dependent variable is booked_percent
lr_listings_venice <- lm(booked_percent ~ within_hour_response+within_few_hours_response+within_day_response, data=final_listings_venice)

#View the results of the regression analysis
summary(lr_listings_venice)

#Checking linear model assumptions
#Plots - Residuals vs Fitted and Scale Location
listings_venice_res <- augment(lr_listings_venice)
plot(lr_listings_venice)

#Testing normality assumption
ggplot(listings_venice_res, aes(.resid)) + geom_histogram(aes(y = ..density..), binwidth = 5) + stat_function(fun = dnorm, args = list(mean = mean(listings_venice_res$.resid), sd = sd(listings_venice_res$.resid)), color="red", size=2)

# test a plot to pdf:
ggsave("output/plot_regression.pdf")
