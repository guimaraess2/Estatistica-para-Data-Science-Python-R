#Instalando os pacotes
if(!require(dplyr)) install.packages("dplyr")
library(dplyr)

if(!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

if(!require(psych)) install.packages("psych")
library(psych)

if(!require(lessR)) install.packages("lessR")
library(lessR)


#Importando o dataset
setwd("C:/Users/guima/OneDrive/Documents/Programa��o em R/R_Data_Science")
stats= read.csv("Blood_pressure.csv")
View(stats)



#Criando uma nova coluna para verificar as diferen�as entre  antes e depois
diferenca = stats$Blood_Pressure_Before - stats$Blood_Pressure_After


#Aplicando o teste shapiro-wilk para verificar a normalidade dos dados
shapiro.test(diferenca)



####### HIP�TESE NULA H0 ######### 
#Os valores da press�o arterial continuaram os mesmos, ap�s a administra��o da droga

###### HIP�TESE ALTERNATIVA H1 #########
#Os valores da press�o arterial diferem, ap�s a administra��o da droga

#Fazendo campara��o das medi��es antes e depois usando t.test
t.test(stats$Blood_Pressure_Before, stats$Blood_Pressure_After, mu=0, 
       alt='two.sided', paired=T, conf.level=0.95)



#Visualiza��o de dados
ggplot(data=stats, aes(y=Blood_Pressure_Before,  x="")) + 
  geom_boxplot(width=0.1, outlier.shape = 1, outlier.size = 2, fill="red") +
  theme_gray() + labs(y="Press�o sist�lica", x="Distribui��o antes")

ggplot(data=stats, aes(y=Blood_Pressure_After,  x="")) + 
  geom_boxplot(width=0.1, outlier.shape = 1, outlier.size = 2, fill="green") +
  theme_gray() + labs(y="Press�o sist�lica", x="Distribui��o depois")


#Fazendo an�lise utilizando estat�stica descritiva
summary(stats)
describe(stats$Blood_Pressure_Before)
describe(stats$Blood_Pressure_After)




