# name: Jovany Cota
# date: 08-22-20
# purpose: daily assignment 10

USAboundaries::us_states()
library(tidyverse)
library(sf)
library(mapview)

# Assignment 1: preserving the internal US boundaries

conus = USAboundaries::us_states() %>%
    filter(!state_name %in% c("Puerto Rico", "Hawaii", "Alaska"))


comb_us = st_combine(conus) %>%
  st_cast("MULTILINESTRING") %>%
  plot(comb_us)

# Assignment 2: dissolve the internal US boundaries

diss_us = st_union(conus) %>%
  st_cast("MULTILINESTRING") %>%
  plot(diss_us)




