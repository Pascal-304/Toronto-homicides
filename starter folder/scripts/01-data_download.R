#### Preamble ####
# Purpose: Download data from opendatatoronto
# Author: Pascal Lee Slew
# Data: 6 February 2022
# Contact: pascal.leeslew@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(opendatatoronto)


#### Data download ####
# From https://open.toronto.ca/dataset/police-annual-statistical-report-homicide/

# Datasets are grouped into packages that have multiple datasets
# Also called 'resources' that are relevant to that topic. So, we first look at the package 
# using a unique key that we obtain from the datasets webpage (see above)

# Get package
library(opendatatoronto)
library(dplyr)

# get all resources for this package
resources <- list_package_resources("7d72bbbe-8adc-4b36-8ad1-5359f1c7a9cc")

#We need the unique key from that list of resources

# There is only one resource and so get_resource() will load that.
# If there is more than one resource, then need to either filter or specify
toronto_homicides <- resources %>% 
  get_resource()

#### Save data ####
write_csv(toronto_homicides, "inputs/data/toronto_homicides.csv")

         