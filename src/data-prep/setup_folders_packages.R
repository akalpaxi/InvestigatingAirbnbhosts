###-- SETUP FOLDERS & PACKAGES --###


#-Folders
dir.create('raw_data/')
dir.create('temp/')
dir.create('output/')

#-Packages
install.packages("tidyverse"); install.packages("dplyr"); install.packages("tibble"); install.packages("hablar"); install.packages("writexl"); install.packages("broom"); install.packages("ggplot2")
library(tidyverse); library(dplyr); library(tibble); library(hablar); library(writexl); library(broom); library(ggplot2)