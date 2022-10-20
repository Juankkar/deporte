############################################################
############ Seguimiento de las actividades   ##############
############################################################

## librerías
library(tidyverse)
library(readxl)
library(glue)
library(lubridate)
library(ggtext)
library(cowplot)

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
        hoy=today()-1,
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
      hoy=today()-1,
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
        hoy=today()-1,
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
        hoy=today()-1,
        es_hoy=fecha == hoy
    )

# suenio %>% view()

#---------------------------------------------------------------------------------------------#
#                           Mi seguimiento general de act                                     #
#---------------------------------------------------------------------------------------------#

### Km recorridos según el día de la semana.

km <- seg_general %>%
    ggplot(aes(dia_semana, km_recorrido,fill=es_hoy,
               size=es_hoy, group=semana)) +
    geom_point(show.legend = FALSE, color="black", pch=21) +
    geom_line(size=1, show.legend = FALSE, 
              color="darkgray") +
    labs(
        title = "Distancia (Km) de recorrido, <br><span style = 'color: darkgray'>todos los días</span> hasta <span style = 'color: red'>el actual</span>",
        x="Día de la semana",
        y="Distancia (Km)"
    ) +
    scale_y_continuous(
        expand = expansion(0),
        limits = c(0,20),
        breaks = seq(0,20,2)
    ) +
    scale_fill_manual(
        breaks=c(FALSE,TRUE),
        values = c("darkgray","red")
    ) +
    scale_size_manual(
        breaks = c(FALSE,TRUE),
        values = c(2,4)
     ) +
    theme(
        plot.title = element_markdown(face = "bold", size = 14),
        axis.title = element_text(face = "bold", size = 13),
        axis.text = element_text(color="black", size=11),
        axis.line = element_line(),
        panel.grid = element_blank(),
        panel.background = element_rect(fill="white", color="white"),
        plot.background = element_rect(fill = "wheat", color="wheat")
    )

### Tiempo de recorrido
tiempo <- seg_general %>%
    ggplot(aes(dia_semana,tiempo_min,fill=es_hoy,
               size=es_hoy, group=semana)) +
    geom_point(show.legend = FALSE, color="black", pch=21) +
    geom_line(size=1, show.legend = FALSE, 
              color="darkgray") +
    labs(
        title = "Tiempo de recorrido, <span style = 'color: darkgray'>todos los días</span> hasta <span style = 'color: red'>el actual</span>",
        x="Día de la semana",
        y="Tiempo"
    ) +
    scale_y_time(
        expand = expansion(0),
        limits = c(0,60*120)
    ) +
    scale_fill_manual(
        breaks=c(FALSE,TRUE),
        values = c("darkgray","red")
    ) +
    scale_size_manual(
        breaks = c(FALSE,TRUE),
        values = c(2,4)
     ) +
     theme(
        plot.title = element_markdown(face = "bold", size = 14),
        axis.title = element_text(face = "bold", size = 13),
        axis.text = element_text(color="black", size=11),
        axis.line = element_line(),
        panel.grid = element_blank(),
        panel.background = element_rect(fill="white", color="white"),
        plot.background = element_rect(fill = "wheat", color="wheat")
    )


## Ritmo promedio 

ritmo_promedio <- seg_general %>%
    ggplot(aes(dia_semana,ritmo_medio_min,fill=es_hoy,
               size=es_hoy, group=semana)) +
    geom_point(show.legend = FALSE, color="black", pch=21) +
    geom_line(size=1, show.legend = FALSE, 
              color="darkgray") +
    labs(
        title = "Ritmo promedio, <span style = 'color: darkgray'>todos los días</span> hasta <span style = 'color: red'>el actual</span>",
        x="Día de la semana",
        y="Tiempo"
    ) +
    scale_y_time(
        expand = expansion(0),
        limits = c(0,60*10)
    ) +
    scale_fill_manual(
        breaks=c(FALSE,TRUE),
        values = c("darkgray","red")
    ) +
    scale_size_manual(
        breaks = c(FALSE,TRUE),
        values = c(2,4)
     ) +
     theme(
        plot.title = element_markdown(face = "bold", size = 14),
        axis.title = element_text(face = "bold", size = 13),
        axis.text = element_text(color="black", size=11),
        axis.line = element_line(),
        panel.grid = element_blank(),
        panel.background = element_rect(fill="white", color="white"),
        plot.background = element_rect(fill = "wheat", color="wheat")
    )

## Ritmo máximo 

ritmo_max <- seg_general %>%
    ggplot(aes(dia_semana,ritmo_max_min,fill=es_hoy,
               size=es_hoy, group=semana)) +
    geom_point(show.legend = FALSE, color="black", pch=21) +
    geom_line(size=1, show.legend = FALSE, 
              color="darkgray") +
    labs(
        title = "Ritmo máximo, <span style = 'color: darkgray'>todos los días</span> hasta <span style = 'color: red'>el actual</span>",
        x="Día de la semana",
        y="Tiempo"
    ) +
    scale_y_time(
        expand = expansion(0),
        limits = c(0,60*10)
    ) +
    scale_fill_manual(
        breaks=c(FALSE,TRUE),
        values = c("darkgray","red")
    ) +
    scale_size_manual(
        breaks = c(FALSE,TRUE),
        values = c(2,4)
     ) +
     theme(
        plot.title = element_markdown(face = "bold", size = 14),
        axis.title = element_text(face = "bold", size = 13),
        axis.text = element_text(color="black", size=11),
        axis.line = element_line(),
        panel.grid = element_blank(),
        panel.background = element_rect(fill="white", color="white"),
        plot.background = element_rect(fill = "wheat", color="wheat")
    )

plot_grid(km, tiempo, ritmo_promedio, ritmo_max,
          ncol=2)

ggsave("ritmo_promedio.png", path="C:\\Users\\jcge9\\Desktop\\deporte\\graficas",
        width = 10, height = 8)

