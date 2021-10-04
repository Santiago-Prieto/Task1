#Santiago Prieto 201814818
#Taller A
rm(list = ls()) 
if(!require(pacman)) install.packages("pacman") ; require(pacman) 
p_load(rio,skimr,tidyverse,readxl,haven,WriteXLS)
Sys.setlocale("LC_CTYPE", "en_US.UTF-8")
#  Punto 1 
vector1 = (0:100)
vector1
vectorimpar = (1:50)*2-1
vectorimpar
#FALTA EL PAR

#Punto 2: Limpiar una base de datos
cultivos = import("task_1/data/input/cultivos.xlsx", range="A9:Y362")
cultivos = cultivos %>% drop_na(CODDEPTO, CODMPIO, DEPARTAMENTO, MUNICIPIO)
cultivos = cultivos %>% pivot_longer(cols=num_range('',1999:2019) , names_to = "Ano", values_to = "Hectareas")

#Punto 3: GEIH

ca_cgen = import("task_1/data/input/2019/Cabecera - Caracteristicas generales (Personas).rds")
ca_deso = import("task_1/data/input/2019/Cabecera - Desocupados.rds") 
ca_ftrab = import("task_1/data/input/2019/Cabecera - Fuerza de trabajo.rds") 
ca_inac = import("task_1/data/input/2019/Cabecera - Inactivos.rds")
ca_ocu = import("task_1/data/input/2019/Cabecera - Ocupados.rds")
