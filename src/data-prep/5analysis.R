###-- REGRESSION ANALYSIS --###


#-Calling object final_listings_venice
final_listings_venice <- read.csv('output/final_listings_venice.csv')

#-We want to investigate the effect of host response time on booked percent
#-The independent variables in the model are the dummy variables (within_hour_response, within_few_hours_response, within_day_response) and the dependent variable is booked_percent
library(broom)
lr_listings_venice <- lm(booked_percent ~ within_hour_response+within_few_hours_response+within_day_response, data=final_listings_venice)

#-View the results of the regression analysis
results_lr <- summary(lr_listings_venice)
results_lr

#-Visualize the relationship
library(ggplot2)
ggplot(final_listings_venice, aes(response_time, booked_percent)) +
  geom_jitter() +
  labs(x = "Host response time", y = "Booked percent") +  
  ggtitle("Figure 1: Relationship between host response time and percentage of bookings")

#-Saving the jitter plot as pdf
ggsave("output/plot_relationship.pdf")

#-Checking linear model assumptions
#-Plots - Residuals vs Fitted and Scale Location
listings_venice_res <- augment(lr_listings_venice)
plot(lr_listings_venice)

#-Testing normality assumption
ggplot(listings_venice_res, aes(.resid)) + geom_histogram(aes(y = ..density..), binwidth = 5) + stat_function(fun = dnorm, args = list(mean = mean(listings_venice_res$.resid), sd = sd(listings_venice_res$.resid)), color="red", size=2)

#-Saving the normality assumption plot as pdf
ggsave("output/plot_normality_assumption.pdf")

#-Model reporting
library(stargazer)
results_table <- stargazer(lr_listings_venice,
                           title = "Figure 2: Impact of host response time on bookings",
                           dep.var.caption = "Booked percent",  
                           dep.var.labels = "",  
                           covariate.labels = c("Intercept","Within hour response", "Within few hours response", "Within day response"),  
                           column.labels = c("Coefficients", "Significance"),
                           notes.label = "Significance levels",  
                           object.names = TRUE, intercept.bottom = FALSE, intercept.top = TRUE, omit.stat = c("adj.rsq"),
                           star.cutoffs = c(.05,.01,.001), ci=FALSE, single.row = TRUE, 
                           type="text", digits = 2 
)

#-Saving the model report as HTML file
library(xtable)
sink("output/results.html")
print(xtable(coefficients(results_lr)), type="html")
sink()
