datos <- read.csv(file = "dataset.csv",header = TRUE, sep = ",")
head(datos)
plot(datos$A8)

#Esto se repite desde A1 hasta A16 para eliminar los elementos con datos perdidos
datos <- subset(datos, A16 != '?')

library(janitor)

tabyl(datos2$A14) 
#Elementos 67 y 40 en A11 podría ser un outlier
#Elemento 28.500 en A8 podría ser un outlier
#Elementos 100000, 51100, 50000 y 31285 en A15 podrían ser outliers
#Elemento 2000 en A14

datos <- subset(datos, A14 != '02000')


#kNN

datosknn = datos[sample(nrow(datos)),]
#Se convierten a entero todas las variables menos la clase
datosknn$A16 <- as.integer(datosknn$A16)

datosknn = datosknn[sample(nrow(datosknn)),]

train <- datosknn[65:646,]
test <- datosknn[1:64,]

library(class)

cl <- factor(datosknn$A16[65:646])
validacion <- datosknn$A16[1:64]

modelo <- knn(train,test,cl,k=2)

table(modelo,validacion)


install.packages("FNN")
library(FNN)

modelo <- knn(train, test, cl, k = 2,algorithm=c("brute"))
validacion <- datosknn$A16[1:64]

table(modelo, validacion)


#Naive Bayes

datosnb = datos[sample(nrow(datos)),]

train <- datosnb[65:646,]
test <- datosnb[1:64,]

library(e1071)

modelo <- naiveBayes(A16 ~ ., train)

validacion <- predict(modelo, test)

table(validacion, test$A16)


install.packages("naivebayes")
library(naivebayes)

modelo <- naive_bayes(A16~.,train)

validacion <- predict(modelo,test)

table(validacion, test)


#SVM

datossvm = datos[sample(nrow(datos)),]

train <- datossvm[65:646,]
test <- datossvm[1:64,]

library(e1071)

modelo <- svm(A16~.,train, kernel='radial')

validacion <- predict(modelo,test)

table(validacion,test$A16)


library(kernlab)

modelo <- ksvm(A16~.,train, kernel='laplacedot')

validacion <- predict(modelo,test)

table(validacion,test$A16)