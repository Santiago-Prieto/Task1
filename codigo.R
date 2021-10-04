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
cultivos = import("task_1/data/input/cultivos.xlsx", range="A9:Y362")#desde A9 pues ahí empieza la base
cultivos = cultivos %>% drop_na(CODDEPTO, CODMPIO, DEPARTAMENTO, MUNICIPIO) #los totales no son necesarios
cultivos = cultivos %>% pivot_longer(cols=num_range('',1999:2019) , names_to = "Ano", values_to = "Hectareas")
browseURL("https://tidyr.tidyverse.org/articles/pivot.html")#Con base en la página de ayuda de Tidyverse
#Punto 3: GEIH

ca_cgen = import("task_1/data/input/2019/Cabecera - Caracteristicas generales (Personas).rds")
#importo y agrego el indicativo
ca_deso = import("task_1/data/input/2019/Cabecera - Desocupados.rds") %>% mutate(deso=1)
ca_ftrab = import("task_1/data/input/2019/Cabecera - Fuerza de trabajo.rds")%>% mutate(ftrab=1)
ca_inac = import("task_1/data/input/2019/Cabecera - Inactivos.rds") %>% mutate(inac=1)
ca_ocu = import("task_1/data/input/2019/Cabecera - Ocupados.rds") %>% mutate(ocu=1)
#se crea la base pegando todas las anteriormente importadas y se dejan las variables pedidas más el indicativo
basegeih = left_join(x = ca_cgen, y = ca_deso, by = c("directorio","secuencia_p","orden"), suffix = c("", "")) %>% left_join(., y = ca_ftrab, by = c("directorio","secuencia_p","orden"), suffix = c("", ""))%>% left_join(., y = ca_inac, by = c("directorio","secuencia_p","orden"), suffix = c("", ""))%>% left_join(., y = ca_ocu, by = c("directorio","secuencia_p","orden"), suffix = c("", ""))
basegeih = basegeih %>% select(c(secuencia_p, orden, directorio, P6020, P6040, P6920, INGLABO, DPTO, fex_c_2011, ESC, mes, P6050, deso, ftrab, inac, ocu))


