# name: Jovany Cota
# date: 08-22-20
# purpose: daily assignment 11

town = readr::read_csv("../geog-176a-lab/data/uscities.csv")

library(tidyverse)
library(sf)
library(mapview)
library(units)

home_town = town

home_town %>%
  st_as_sf(coords = c("lng", "lat"), crs = 4326) %>%
  filter(city %in% c("Santa Barbara", "New York")) %>%
  st_distance()


home_town_2 = town %>%
  st_as_sf(coords = c("lng", "lat"), crs = 4326) %>%
  filter(city %in% c("Santa Barbara", "New York")) %>%
  st_transform(5070) %>%
  st_distance()

home_town_3 = town %>%
  st_as_sf(coords = c("lng", "lat"), crs = 4326) %>%
  filter(city %in% c("Santa Barbara", "New York")) %>%
  st_transform('+proj=eqdc +lat_0=40 +lon_0=-96 +lat_1=20 +lat_2=60 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs') %>%
  st_distance() %>%
  drop_units()




