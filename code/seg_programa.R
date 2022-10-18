############################################################
############ Seguimiento de las actividades   ##############
############################################################

## librerías
library(tidyverse)
library(readxl)
library(glue)
library(lubridate)

#--------------------------------#
# Importar y preprocesar mi data #
#--------------------------------#

###### Seguimeinto general

url_seg_general <- "https://raw.githubusercontent.com/Juankkar/deporte/main/data/seguimiento.csv"
seg_general <- read_csv(url_seg_general) %>% 
    mutate(
        dia_semana=wday(fecha, label=TRUE, abbr = FALSE),
        mes=month(fecha, label=TRUE, abbr = FALSE),
        anio=year(fecha),
        hoy=today(),
        es_hoy=fecha == hoy
    )

# seg_general[,c("dia_semana","anio","mes","hoy", "fecha", "es_hoy")] %>% view()

###### Seguimiento del ritmo por km

url_rit_km <- "https://raw.githubusercontent.com/Juankkar/deporte/main/data/seg_ritmo.csv"
rit_km <- read_csv(url_rit_km) %>% 
    mutate(
      dia_semana=wday(fecha, label=TRUE, abbr = FALSE),
        mes=month(fecha, label=TRUE, abbr = FALSE),
        anio=year(fecha),
        hoy=today(),
        es_hoy=fecha == hoy  
    )

# rit_km %>% view()

###### Seguimiento del ritmo cardiaco

url_rit_card <- "https://raw.githubusercontent.com/Juankkar/deporte/main/data/seg_cardiaco.csv"
rit_card <- read_csv(url_rit_card) %>% 
    mutate(
        dia_semana=wday(fecha, label=TRUE, abbr = FALSE),
        mes=month(fecha, label=TRUE, abbr = FALSE),
        anio=year(fecha),
        hoy=today(),
        es_hoy=fecha == hoy
    )

# rit_card %>% view()

###### Seguimiento del ritmo cardiaco

url_suenio <- "https://raw.githubusercontent.com/Juankkar/deporte/main/data/sueno.csv"
suenio <- read_csv(url_sueno) %>% 
    mutate(
        dia_semana=wday(fecha, label=TRUE, abbr = FALSE),
        mes=month(fecha, label=TRUE, abbr = FALSE),
        anio=year(fecha),
        hoy=today(),
        es_hoy=fecha == hoy
    )

# suenio %>% view()



