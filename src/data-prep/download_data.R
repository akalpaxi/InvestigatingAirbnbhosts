# download venice data
###-- DOWNLOAD DATA FILES FROM AIRBNB --###


dir.create('raw_data/')

download.file('http://data.insideairbnb.com/italy/veneto/venice/2021-08-06/data/listings.csv.gz', 'raw_data/listings_venice.csv.gz')
listings_venice <- read.csv(gzfile('raw_data/listings_venice.csv.gz'), as.is = TRUE)
write.csv(listings_venice,"raw_data/listings_venice.csv")

download.file('http://data.insideairbnb.com/italy/veneto/venice/2021-08-06/data/calendar.csv.gz', 'raw_data/calendar.csv.gz')
calendar_venice <- read.csv(gzfile('raw_data/calendar.csv.gz'), as.is = TRUE)
write.csv(calendar_venice,"raw_data/calendar_venice.csv")

###-- OR

###-- DOWNLOAD DATA FILES FROM GOOGLE DRIVE AS EXCEL --###

#-Load packages
install.packages("googledrive")
install.packages("readr")
library(googledrive)
library(readr)

#-Download data
data_id <- "https://drive.google.com/file/d/1pdxa0vzqL3A6t5Eb7vce3tAXZKSFIQZw/view?usp=sharing"
out_file <- "raw_data/listings_venice.csv" 

drive_download(
  as_id(data_id), 
  path = out_file,
  overwrite = TRUE)

listings_venice <- read.csv("raw_data/listings_venice.csv")



data_id1 <- "https://drive.google.com/file/d/1UWzKbCN85jpbY2Hiy7F6c3NJy5gL_9We/view?usp=sharing"
out_file1 <- "raw_data/calendar_venice.csv" 

drive_download(
  as_id(data_id1), 
  path = out_file1,
  overwrite = TRUE)

calendar_venice <- read.csv("raw_data/calendar_venice.csv")