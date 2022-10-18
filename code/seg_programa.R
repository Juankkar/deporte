############################################################
############ Seguimiento de las actividades   ##############
############################################################

## librerías
library(tidyverse)
library(readxl)
library(glue)
library(lubridate)

# importar data

###### Seguimeinto general

url_seg_general <- "https://raw.githubusercontent.com/Juankkar/deporte/main/data/seguimiento.csv"
seg_general <- read_csv(url_seg_general)

###### Seguimiento del ritmo por km

url_rit_km <- "https://raw.githubusercontent.com/Juankkar/deporte/main/data/seg_ritmo.csv"
rit_km <- read_csv(url_rit_km) 

###### Seguimiento del ritmo cardiaco

url_rit_card <- "https://raw.githubusercontent.com/Juankkar/deporte/main/data/seg_cardiaco.csv"
rit_card <- read_csv(url_rit_card)

###### Seguimiento del ritmo cardiaco

url_sueno <- "https://raw.githubusercontent.com/Juankkar/deporte/main/data/sueno.csv"
sueno <- read_csv(url_sueno)