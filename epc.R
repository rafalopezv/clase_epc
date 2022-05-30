# sobre: demo clase Epc
---
title: "Cómo se siente hacer lo que hicimos desde el código"
subtitle: "Preparado para Giovani, Constanza, Jorge, Sabrina, Lauriel"
output: learnr::tutorial
runtime: shiny_prerendered
---

```{r setup, include=FALSE}
library(learnr)
library(tidyverse)
library(tidyverse)
library(nycflights13)
library(purrr)
```

Ver el nombre de las columnas

```{r nombres, exercise=TRUE}
# ver el nombre de las columnas
flights %>% colnames()
```

Ver la dimensión de la base de datos
```{r estructura, exercise=TRUE}
# descarga y limpieza
dim(flights)
```

Ver la clase de las columnas
```{r clase, exercise=TRUE}
# descarga y limpieza
map(flights, class)
```

Ver la estructura de la base de datos
```{r estructura1, exercise=TRUE}
flights %>% summary()
```

Filtrar por un atributo:  mes
```{r filtro, exercise=TRUE}
flights %>% 
  dplyr::filter(month == 1)
```

Filtrar por un mas de un atributo:  mes y dia
```{r filtro1, exercise=TRUE}
flights %>% 
  dplyr::filter(
    month == 1, 
    day == c(1, 8)
  )
```

Ordenar una columna
```{r arrange, exercise=TRUE}
flights %>% 
  dplyr::arrange(desc(dep_delay))
```

Ver distribución de atrasos en partida
```{r dist, exercise=TRUE}
flights %>% 
  ggplot(aes(dep_delay)) +
  geom_density()
```

Ver distribución de atrasos en partida por mes
```{r dist1, exercise=TRUE}
flights %>% 
  ggplot(aes(dep_delay)) +
  geom_density() +
  facet_wrap(~month)
```

Computar promedio y desviación estandar de atrasos en llegadas por mes
```{r grupo, exercise=TRUE}
flights %>% 
  group_by(month) %>% 
  summarise(
    promedio = mean(arr_delay, na.rm = T),
    desviación = sd(arr_delay, na.rm = T)
  )
```


Graficar: atrasos en llegadas con tiempo de vuelo
```{r grupo1, exercise=TRUE}
flights %>% 
  ggplot(aes(air_time, arr_delay)) +
  geom_point()
```

Graficar: atrasos en llegadas con tiempo de vuelo (mas de 600 minutos en aire)
```{r grupo2, exercise=TRUE}
flights %>% 
  filter(arr_delay >= 600) %>% 
  ggplot(aes(air_time, arr_delay)) +
  geom_point() +
  geom_smooth(method = "lm")
```
