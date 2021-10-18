# The effect of Airbnb host response time on bookings


## Good Host vs Bad Host: What makes an "attractive" Airbnb host?
Attractive host refers to the host that due to specific qualities, traits and other factors is more preferable than the other competitive AirBnb hosts.

![What_makes_a_good_Airbnb_host_gif](https://user-images.githubusercontent.com/90336625/133652498-0b09cb3a-7a65-482d-abf3-01b0570e38b2.gif)



## And why global?
__Simply because the world is more connected than ever before!__

Travelling has become a global trend and consequently travelers from Europe can now reach destinations in Asia and get to know the local culture, a couple from Latin America can safely book accommodation for their adventurous trip in the magical landscapes of Africa or a researcher from Australia can easily select a single room for his investigation journey to North America and the list is endless...

## Research Motivation
As a result of this global connectivity and increased travelling frequency the pioneering platform of AirBnB has been established as the leader in online lodging, primarily home stays for vacation rentals and tourism activities with more than 2.8 million hosts(2021). Nevertheless, increased offer comes with increased competition and the hosts need to find new ways of attracting the people.

By assessing whether the response time affect the number of bookings that the hosts have, we will provide useful insight and tips to AirBnB's hosts in order to improve their overall performance and service delivery.


__Why it matters?__
* Greater response time leads to higher chance to become a *Superhost* on the platform!
* By responding faster, hosts can remove customers' anxiety about the booking process! Some guests contact more than one listing owner at the same time and it is crutial to respond as quickly as possible!
* Delay replies might lead to lost revenue. 
* Response rate affect hosts' search placement. 

**Quicker response time is one of the most important elements of being a good hosts**


## Method and results
The method that was used to investigate whether there is a relationship between the host response time and the number of bookings of the host is **linear regression analysis**. Linear regression analysis is used to explain the relationship between one dependent variable and one or more independent variables. This research method will show whether there is a positive/negative effect of host response time on number of bookings or if there is no effect at all. The independent variable is host response time and consist of four categores - within an hour, within a few hours, within day response and within a few days or more. In order to include this variable in the analysis three dummy variables were created and as base level is considered the category within a few days or more. These three dummy variables are used in the regression and are used to predict the dependent variable - booked_percent. To compute this variable originally the "avaliable" variable was used, showing whether a listings was or was not avaliable at a specific date. The avaliable variable was firstly recoded into a dummy variable and were counted the total times a listing was booked (booked_no). Then a new variable was created counting for how many dates the listing could have been booked. Finally, to create the new variable booked_percent, used as a dependent variable,  the previous variables were devided. To sum up the model was as follows: 
* Indpendent variables: Dummy within an hour; dummy within a few hours and dummy within day response
* Dependent variable: Booked_percent - the percentage of the times when a specific host's listings have been booked

### Summary of the results
* The regression analysis shows that there is a significant effect of replying within an hour on the percentage of lisigns that are booked (with significance level at 5%). That means that a host's listing is more likely to get booked when the host replies within an hour compared to when he/she replies within a few days or more. 
* Another siginificant finding is that replying within a few hours also has a positive effect on the percentage of booked listings compared to the reply within a few days or more (again using 5% significance level).
* Finally, replying within a day has a positive significant influence on the percentage of booked listings using 10% signficance level. If a host responds within a day is more likely to get his room/appartment booked compared to when he/she replies to a customer within a few days. However, this effect is smaller, meaning that the faster the host replies the more likely he is to get his listing booked! 

## Discussion and recommendations
These effects are driven by the customer's urgency to get an appartment or a room booked, the availability of other offers and by impatience on the customer' side. Therefore, we advice AirBnB hosts to respond as quicky as possible to their messages from customers in order to increase the likelihood of their room/appartment to be reserved and to improve their host response rating. The host reponse time is  previously considered by customers (can be checked on the hosts'profiles) and faster the response is, the bigger the chance of a booking.

## Repository overview
This repository consists of 3 folders and **NUMBER OF files**. The data that was used for this particular research can be downloaded by using the download_data.R file which uses the data uploaded on the [Inside Airbnb](http://insideairbnb.com/get-the-data.html) website. The download_data.R file can be found in the soure (scr) folder. For this research the "listings" and "calendar" datasets are needed. After downloading the datasets, the data should be cleaned and prepared for the analysis. This can be done by firstly executing removing_columns.R consisting of codes to remove the unneccessary variables (columns), aggregation and merging of the two datasets. Then the file converting_variable_class.R should be run in order to remove the rows with missing data. Finally, the last step for data cleaning is to execute the file manipulating_data.R, where dummy vriables are created, the data is aggregated, variables are transformed and the final dataset is saved in the output folder. The process of data cleaning is finished is time to move to the analysis. The analysis.R file is found in the source (scr) folder. After runing the codes a table from the regression analysis, a jitter plot visualizing the regression and a plot for the normality assumption will be saved in the the output folder.

Running the files separately one after each other is more time-consuming and might result in errors if the correct order is not followed. Therefore, a better solution is to run all codes automatically. How to do that? Open the makefile and write "make" in the command prompt. All files will be automatically run for you in the correct order.

If you are wondering what are the other files in the repository, here is a quick guide:
* Gitignore file - lists the files that do not need to be saved
* RMarkdown - found in the source (scr) folder - used for explanation of the variables in the dataset and presenting graphs and plots from the analysis
* Readme - the file you are reading at the moment that summarizes the whole research and provides information about what is included in this repository

## Instructions
For this research we used R and RStudio software. Useful information about the software and guidelines about the installation process can be found [here](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/). Moreover, to run the automated pipeline, you should install Make which you can do by following the guidelines provided [here](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/). 

Additionally, different packages should be installed in RStudio in order to run the codes. For convenience the following code snippet can be copied and pasted into RStudio:

```
install.packages("tidyverse")
install.packages("dplyr")
install.packages("tibble")
install.packages("hablar")
install.packages("writexl")
install.packages("broom")
install.packages("ggplot2")
install.packages("xtable")
install.packages("stargazer")
install.packages("knitr")
```


## About
In the context of the course [Data Preparation and Workflow Management](https://dprep.hannesdatta.com/), part of the [MSc Marketing Analytics](https://www.tilburguniversity.edu/education/masters-programmes/marketing-analytics) in [Tilburg University](https://www.tilburguniversity.edu/), we executed a research on the impact of hosts' factors (i.e., how quickly a host responds to (potential) guests) on the hosts' overall performance. Our data is collected from the most popular cities across continents for 2021 via [Inside Airbnb](http://insideairbnb.com/get-the-data.html).


## Contributors
Our team is composed of five members: [Alexandra Duta](https://github.com/AlexandraDuta), [Renos Chatzistavrou](https://github.com/topuserever), [Aikaterini Kalpaxi](https://github.com/akalpaxi), [Polina Petkova](https://github.com/polinapetkova), and [Maria Vencheva](https://github.com/MariaVelcheva).






