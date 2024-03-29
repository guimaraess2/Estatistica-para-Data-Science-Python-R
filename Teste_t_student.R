#Importando os pacotes
if(!require(dplyr)) install.packages("dplyr")
library(dplyr)

if(!require(car)) install.packages("car")
library(car) 

if(!require(RVAideMemoire)) install.packages("RVAideMemoire")
library(RVAideMemoire)

if(!require(ggpubr)) install.packages("ggpubr")
library(ggpubr) 

if(!require(tidyverse)) install.packages("tidyverse")
library(tidyverse)

if(!require(viridis)) install.packages("viridis")
library(viridis)

#Importando o dataset
stats = read.csv('Turmas_Machine_Learning.csv')
glimpse(stats)
View(stats)

#Visualiza��o dos dados
boxplot(stats$Turma._ML_01, stats$Turma._ML_02, names=c('Turma 1', 'Turma 2'),
        main='M�dias das turmas', col=c('lightblue', 'green'))


#testar a normalidade dos dados com o teste shapiro-Wilk
shapiro.test(stats$Turma._ML_01)
shapiro.test(stats$Turma._ML_02)

#As amostras tiveram valor de p-value = 0.61 e 0.66 respectivamente
#Como os valores s�o maiores que 0.05 ent�o as distribui��es s�o normais

#Testar a homogeneidade de vari�ncias utilizando o teste de Levene
y = c(stats$Turma._ML_01, stats$Turma._ML_02)
grupo = as.factor (c(rep(1, length(stats$Turma._ML_01)),
                     rep(2, length(stats$Turma._ML_02))))

leveneTest(y ~ grupo)

#Aplicando o teste com n�vel de confian�a de 95%            
t.test(stats$Turma._ML_01, stats$Turma._ML_02, conf.level = 0.95)            
          
#Conclus�o final:
#Estatisticamente falando, n�o h� diferen�as significativas entre as notas da 
#turma 1 e da turma 2, apesar das m�dias serem diferentes, 
#provavelmente se aumentasse o valor de participantes das turmas as m�dias tenderiam a se igualar.


            
