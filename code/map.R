
library(janitor)
library(tidyverse)
library(sf)
library(tmap)


collections <- readxl::read_excel("code/AUS_collections_merged.xlsx") |>
  clean_names() |>
  select(sample_id, collection_date, location, site, longitude, latitude, host_family, host_genus, host_species) |>
  mutate(lat=latitude, lon=longitude) |>
  na.omit(longitude) |>
  st_as_sf(coords = c("longitude", "latitude"), crs = 4326)



tmap_mode("view")
tm_basemap("Esri.WorldImagery") +
tm_shape(collections) +
  tm_symbols(fill="lat",
             size=0.5,
             shape=21)
