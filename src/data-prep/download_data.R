# download venice data
dir.create('data/')
download.file('http://data.insideairbnb.com/italy/veneto/venice/2021-08-06/data/listings.csv.gz',
              'data/listings_venize.csv.gz')