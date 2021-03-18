#!/usr/bin/RStudio
library(dplyr)
library(tidyr)
#load(here::here("toulouse_appartments.Rda"))
# keep EN dataset
apartments <- appartements
# translate names to FR
names(appartements) <- c("prix_m2", "année_construction", "surface", "étage", "nb_chambre", "quartier") 
# align test_set
data("apartments_test")
appartements_test <- apartments_test
names(appartements_test) <- names(appartements) 
levels(appartements_test$quartier) <- levels(appartements$quartier)
  
# save
save(appartements, appartements_test, safti_l, apartments, file = here::here("toulouse_appartements.Rda"))
