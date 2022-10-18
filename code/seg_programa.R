############################################################
############ Seguimiento de las actividades   ##############
############################################################

## librerías
library(tidyverse)
library(readxl)
library(glue)
library(lubridate)
library(ggtext)

#--------------------------------#
# Importar y preprocesar mi data #
#--------------------------------#

###### Seguimeinto general

url_seg_general <- "https://raw.githubusercontent.com/Juankkar/deporte/main/data/seguimiento.csv"
seg_general <- read_csv(url_seg_general) %>% 
    mutate(
        dia_semana=wday(fecha, label=TRUE, abbr = FALSE),
        semana=week(fecha),
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
      semana=week(fecha),
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
        semana=week(fecha),
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
        semana=week(fecha),
        mes=month(fecha, label=TRUE, abbr = FALSE),
        anio=year(fecha),
        hoy=today(),
        es_hoy=fecha == hoy
    )

# suenio %>% view()

#---------------------------------------------------------------------------------------------#
#                           Mi seguimiento general de act                                     #
#---------------------------------------------------------------------------------------------#

# Km recorridos según el día de la semana.

seg_general %>%
    ggplot(aes(dia_semana, km_recorrido,color=es_hoy,
               size=es_hoy, group=semana)) +
    geom_point(show.legend = FALSE) +
    geom_line(size=1, show.legend = FALSE) +
    labs(
        title = "Carrera: distancia de recorrido en la actividad",
        x="Día de la semana",
        y="Distancia (Km)"
    ) +
    scale_y_continuous(
        expand = expansion(0),
        limits = c(0,20),
        breaks = seq(0,20,2)
    ) +
    scale_color_manual(
        breaks=c(FALSE,TRUE),
        values = c("darkgray","red")
    ) +
    scale_size_manual(
        breaks = c(FALSE,TRUE),
        values = c(2,4)
     ) +
    theme(
        axis.line = element_line(),
        panel.grid = element_blank(),
        panel.background = element_rect(fill="white", color="white"),
        plot.background = element_rect(fill = "wheat", color="wheat")
    )

ggsave("dist_recorrido.png", path="C:\\Users\\jcge9\\Desktop\\deporte\\graficas",
       width = 6, height = 5)

