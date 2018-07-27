datos <- read.csv(file = "dataset.csv",header = TRUE, sep = ",")
head(datos)
plot(datos2$A8)

datos2<-datos

#Esto se repite desde A1 hasta A16 para eliminar los elementos con datos perdidos
datos2 <- subset(datos2, A16 != '?')

library(janitor)

tabyl(datos2$A14) 
#Elementos 67 y 40 en A11 podría ser un outlier
#Elemento 28.500 en A8 podría ser un outlier
#Elementos 100000, 51100, 50000 y 31285 en A15 podrían ser outliers
#Elemento 2000 en A14

datos2 <- subset(datos2, A14 != '02000')