# download venice data
dir.create('raw_data/')
download.file('http://data.insideairbnb.com/italy/veneto/venice/2021-08-06/data/listings.csv.gz', 'raw_data/listings_venice.csv.gz')

listings_venice <- read.csv(gzfile('raw_data/listings_venice.csv.gz'), as.is = TRUE)
# inspect the dataset so we know what we are interested in:
head(listings_venice)
View(listings_venice)
glimpse(listings_venice)

download.file('http://data.insideairbnb.com/italy/veneto/venice/2021-08-06/data/calendar.csv.gz', 'raw_data/calendar.csv.gz')
calendar_venice <- read.csv(gzfile('raw_data/calendar.csv.gz'), as.is = TRUE)
head(calendar_venice)
View(calendar_venice)
glimpse(calendar_venice)

