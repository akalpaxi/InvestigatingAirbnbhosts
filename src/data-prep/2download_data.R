###-- SETUP FOLDERS & PACKAGES --###


#-Folders
dir.create('raw_data/')
dir.create('temp/')
dir.create('output/')
#-Packages
install.packages("tidyverse",repos = "http://cran.us.r-project.org"); install.packages("dplyr",repos = "http://cran.us.r-project.org"); install.packages("tibble",repos = "http://cran.us.r-project.org"); install.packages("hablar",repos = "http://cran.us.r-project.org"); install.packages("writexl",repos = "http://cran.us.r-project.org"); install.packages("broom",repos = "http://cran.us.r-project.org"); install.packages("ggplot2",repos = "http://cran.us.r-project.org"); install.packages("madelsummary",repos = "http://cran.us.r-project.org")

###-- DOWNLOAD DATA FILES FROM AIRBNB --###


download_data <- function(url, filename){
  download.file(url = url, destfile = paste0(filename, ".csv.gz"))
}

url_listings <- "http://data.insideairbnb.com/italy/veneto/venice/2021-08-06/data/listings.csv.gz"
url_calendar <- "http://data.insideairbnb.com/italy/veneto/venice/2021-08-06/data/calendar.csv.gz"

download_data(url_listings, "raw_data/listings_raw")
download_data(url_calendar, "raw_data/calendar_raw")

listings_venice <- read.csv(gzfile('raw_data/listings_raw.csv.gz'), as.is = TRUE)
write.csv(listings_venice,"raw_data/listings_raw.csv")

calendar_venice <- read.csv(gzfile('raw_data/calendar_raw.csv.gz'), as.is = TRUE)
write.csv(calendar_venice,"raw_data/calendar_raw.csv")