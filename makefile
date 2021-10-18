all: output/final_listings_venice.csv output/final_listings_venice.xlsx output/plot_relationship.pdf output/plot_normality_assumption.pdf output/results.html

raw_data/listings_raw.csv raw_data/calendar_raw.csv: src/data-prep/1download_data.R
		R --vanilla < src/data-prep/1download_data.R
		
temp/listings_col_removed.csv temp/calendar_col_removed.csv temp/listings_merged.csv: src/data-prep/2removing_columns.R raw_data/listings_raw.csv raw_data/calendar_raw.csv
		R --vanilla < src/data-prep/2removing_columns.R
		
temp/listings_merged_clean.csv: src/data-prep/3converting_variables.R temp/listings_merged.csv
		R --vanilla < src/data-prep/3converting_variables.R
		
output/final_listings_venice.csv output/final_listings_venice.xlsx: src/data-prep/4manipulating_dataset.R temp/listings_merged_clean.csv
		R --vanilla < src/data-prep/4manipulating_dataset.R
		
output/plot_relationship.pdf output/plot_normality_assumption.pdf output/results.html: src/data-prep/5analysis.R output/final_listings_venice.csv
		R --vanilla < src/data-prep/5analysis.R