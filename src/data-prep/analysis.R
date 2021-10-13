###-- ANALYSIS --###
install.packages("broom")
library(broom)
library(ggplot2)

# --- Regression Analysis --- #

#We want to investigate the effect of host response time on booked percent
#The independent variables in the model are the dummy variables (within_hour_response, within_few_hours_response, within_day_response) and the dependent variable is booked_percent
lr_listings_venice <- lm(booked_percent ~ within_hour_response+within_few_hours_response+within_day_response, data=final_listings_venice)

#View the results of the regression analysis
summary(lr_listings_venice)

#Checking linear model assumptions
#Plots - Residuals vs Fitted, Normal Q-Q, and Scale Location
listings_venice_res <- augment(lr_listings_venice)
plot(lr_listings_venice)




# test a plot to pdf:
pdf("output/test_plot")
plot(x = final_listings_venice$very_fast_response, 
     y = final_listings_venice$booked_percent, 
     type = "l", 
     xlab = "Very fast response",
     ylab = "Booked percentage", 
     main = "Just a test")
dev.off()