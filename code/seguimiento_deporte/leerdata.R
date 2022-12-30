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
library(car)

#--------------------------------#
# Importar y preprocesar mi data #
#--------------------------------#

fake_data1 <- tibble(x=rep(c(1:50),4),
                     y=rep(c(1:50),4),
                     grupos=c(rep("grupo1",50),rep("grupo2",50), rep("grupo3",50),rep("grupo4",50)))

###### Seguimeinto general

url_seg_general <- "../../data/seguimiento.csv"
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

# url_rit_km <- "https://raw.githubusercontent.com/Juankkar/deporte/main/data/seg_ritmo.csv"
# rit_km <- read_csv(url_rit_km) %>% 
#     mutate(
#       dia_semana=wday(fecha, label=TRUE, abbr = FALSE),
#       semana=week(fecha),
#       mes=month(fecha, label=TRUE, abbr = FALSE),
#       anio=year(fecha),
#       hoy=today()-1,
#       es_hoy=fecha == hoy  
#     )
# 
# # rit_km %>% view()
# 
# ###### Seguimiento del ritmo cardiaco
# 
# url_rit_card <- "https://raw.githubusercontent.com/Juankkar/deporte/main/data/seg_cardiaco.csv"
# rit_card <- read_csv(url_rit_card) %>% 
#     mutate(
#         dia_semana=wday(fecha, label=TRUE, abbr = FALSE),
#         semana=week(fecha),
#         mes=month(fecha, label=TRUE, abbr = FALSE),
#         anio=year(fecha),
#         hoy=today()-1,
#         es_hoy=fecha == hoy
#     )
# 
# # rit_card %>% view()
# 
# ###### Seguimiento del ritmo cardiaco
# 
# url_suenio <- "https://raw.githubusercontent.com/Juankkar/deporte/main/data/sueno.csv"
# suenio <- read_csv(url_sueno) %>% 
#     mutate(
#         dia_semana=wday(fecha, label=TRUE, abbr = FALSE),
#         semana=week(fecha),
#         mes=month(fecha, label=TRUE, abbr = FALSE),
#         anio=year(fecha),
#         hoy=today()-1,
#         es_hoy=fecha == hoy
#     )
# 
# # suenio %>% view()
# 
# #---------------------------------------------------------------------------------------------#
# #                           Mi seguimiento general de act                                     #
# #---------------------------------------------------------------------------------------------#


# ### Tiempo de recorrido
# estadisticos_tiempo <- seg_general %>%
#     filter(actividad == "correr") %>%
#     mutate(tiempo_sec=as.numeric(tiempo_min)) %>%
#     select(tiempo_sec) %>%
#     summarise(media_tiempo=round(mean(tiempo_sec, na.rm=TRUE)/60,2),
#               sd_tiempo=round(sd(tiempo_sec, na.rm=TRUE)/60,2))
# 
# tiempo <- seg_general %>%
#     ggplot(aes(dia_semana,tiempo_min,fill=es_hoy,
#                size=es_hoy, group=semana)) +
#     geom_line(size=1, show.legend = FALSE, 
#               color="darkgray") +
#     geom_point(show.legend = FALSE, 
#                color="black", pch=21) +
#     labs(
#         title = "Tiempo de recorrido, <span style = 'color: darkgray'>todos los días</span> hasta <span style = 'color: red'>el actual</span>",
#         x="Día de la semana",
#         y="Tiempo"
#     ) +
#     scale_y_time(
#         expand = expansion(0),
#         limits = c(0,60*120)
#     ) +
#     scale_fill_manual(
#         breaks=c(FALSE,TRUE),
#         values = c("darkgray","red")
#     ) +
#     scale_size_manual(
#         breaks = c(FALSE,TRUE),
#         values = c(2,4)
#      ) +
#      theme(
#         plot.title = element_markdown(face = "bold", size = 14),
#         axis.title = element_text(face = "bold", size = 13),
#         axis.text = element_text(color="black", size=11),
#         axis.line = element_line(),
#         panel.grid = element_blank(),
#         panel.background = element_rect(fill="white", color="white"),
#         plot.background = element_rect(fill = "wheat", color="wheat")
#     )
# 
# 
# ## Ritmo promedio 
# 
# estadisticos_ritmo <- seg_general %>%
#     filter(actividad == "correr") %>%
#     mutate(ritmo_medio_sec=as.numeric(ritmo_medio_min)) %>%
#     select(ritmo_medio_sec) %>%
#     summarise(media_ritmo=round(mean(ritmo_medio_sec, na.rm=TRUE)/60,2),
#               sd_ritmo=round(sd(ritmo_medio_sec, na.rm=TRUE)/60,2))
# 
# ritmo_promedio <- seg_general %>%
#     ggplot(aes(dia_semana,ritmo_medio_min,fill=es_hoy,
#                size=es_hoy, group=semana)) +
#     geom_line(size=1, show.legend = FALSE, 
#               color="darkgray") +
#     geom_point(show.legend = FALSE,
#                color="black", pch=21) +
#     labs(
#         title = "Ritmo promedio, <span style = 'color: darkgray'>todos los días</span> hasta <span style = 'color: red'>el actual</span>",
#         x="Día de la semana",
#         y="Tiempo"
#     ) +
#     scale_y_time(
#         expand = expansion(0),
#         limits = c(0,60*10)
#     ) +
#     scale_fill_manual(
#         breaks=c(FALSE,TRUE),
#         values = c("darkgray","red")
#     ) +
#     scale_size_manual(
#         breaks = c(FALSE,TRUE),
#         values = c(2,4)
#      ) +
#      theme(
#         plot.title = element_markdown(face = "bold", size = 14),
#         axis.title = element_text(face = "bold", size = 13),
#         axis.text = element_text(color="black", size=11),
#         axis.line = element_line(),
#         panel.grid = element_blank(),
#         panel.background = element_rect(fill="white", color="white"),
#         plot.background = element_rect(fill = "wheat", color="wheat")
#     )
# 
# ## Ritmo máximo 
# 
# estadisticos_ritmo_max <- seg_general %>%
#     filter(actividad == "correr") %>%
#     mutate(ritmo_max_sec=as.numeric(ritmo_max_min)) %>%
#     select(ritmo_max_sec) %>%
#     summarise(media_ritmo=round(mean(ritmo_max_sec, na.rm=TRUE)/60,2),
#               sd_ritmo=round(sd(ritmo_max_sec, na.rm=TRUE)/60),7)
# 
# ritmo_max <- seg_general %>%
#     ggplot(aes(dia_semana,ritmo_max_min,fill=es_hoy,
#                size=es_hoy, group=semana)) +
#     geom_line(size=1, show.legend = FALSE, 
#               color="darkgray") +
#     geom_point(show.legend = FALSE, 
#                color="black", pch=21) +
#     labs(
#         title = "Ritmo máximo, <span style = 'color: darkgray'>todos los días</span> hasta <span style = 'color: red'>el actual</span>",
#         x="Día de la semana",
#         y="Tiempo"
#     ) +
#     scale_y_time(
#         expand = expansion(0),
#         limits = c(0,60*10)
#     ) +
#     scale_fill_manual(
#         breaks=c(FALSE,TRUE),
#         values = c("darkgray","red")
#     ) +
#     scale_size_manual(
#         breaks = c(FALSE,TRUE),
#         values = c(2,4)
#      ) +
#      theme(
#         plot.title = element_markdown(face = "bold", size = 14),
#         axis.title = element_text(face = "bold", size = 13),
#         axis.text = element_text(color="black", size=11),
#         axis.line = element_line(),
#         panel.grid = element_blank(),
#         panel.background = element_rect(fill="white", color="white"),
#         plot.background = element_rect(fill = "wheat", color="wheat")
#     )
# 
# plot_grid(km, tiempo, ritmo_promedio, ritmo_max,
#           ncol=2)
# 
# # ggsave("ritmo_promedio.png", path="C:\\Users\\jcge9\\Desktop\\deporte\\graficas",
# #        width = 10, height = 8)
# 
# ggsave("ritmo_promedio.png", path="../graficas",
#        width = 10, height = 8)
# 
# 
# fake_etiquetas1 <- tibble(
#     x=c(rep(25,9)),
#     y=c(30,25,20,rep(c(28,24),3)),
#     label=c(glue("Promedio: {estadisticos_km$media_km} Km"), glue("Desviación típica: {estadisticos_km$sd_km} Km"),
#             glue("Número de carreras: {dias_correr_km$n}"), glue("Promedio: {estadisticos_tiempo$media_tiempo} min"),
#             glue("Desviación típica: {estadisticos_tiempo$sd_tiempo} min"),glue("Promedio: {estadisticos_ritmo$media_ritmo} min"),
#             glue("desviación típica: {estadisticos_ritmo$media_ritmo} min"),glue("Promedio: {estadisticos_ritmo_max$media_ritmo} min"),
#             glue("Desviación típica: {estadisticos_ritmo_max$sd_ritmo} min")),
#     grupos=c(rep("Distancia recorrida (km)",3), rep("Tiempo de recorrido (min)",2), 
#              rep("Ritmo promedio (min)",2), rep("Ritmo maximo (min)",2))
# )
# 
# estadisticos_ritmo_max$sd_ritmo
# 
# fake_data1 %>%
#     mutate(
#         grupos=factor(grupos,
#                       levels = c("grupo1", "grupo2", "grupo3", "grupo4"),
#                       labels = c("Distancia recorrida (km)", "Tiempo de recorrido (min)",
#                                  "Ritmo promedio (min)", "Ritmo maximo (min)"))
#     ) %>%
#     ggplot(aes(x,y)) +
#     facet_wrap(~grupos,ncol=2) +
#     geom_text(data = fake_etiquetas1, aes(x,y,label=label), inherit.aes = FALSE,
#               size=6) +
#     labs(
#         x=NULL, y=NULL
#     ) +
#     scale_y_continuous(limits = c(10,40)) +
#     theme_classic() +
#     theme(
#         strip.text = element_text(size = 15),
#         axis.line = element_blank(),
#         axis.text = element_blank(),
#         axis.ticks = element_blank()
#     )
# 
# #ggsave("C:\\Users\\jcge9\\Desktop\\deporte\\graficas\\estadisticas1.png",
# #       width=8, height = 6)
# 
# ggsave("../graficas/estadisticas1.png",
#        width=8, height = 6)
