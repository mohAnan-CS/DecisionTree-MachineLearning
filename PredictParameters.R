# include libraries
library(foreign)
library(C50)

df = read.spss("C:\\Users\\twitter\\Desktop\\Project2\\Datasets\\Data and analysis\\SefSec_2014_HH_weight new.sav", to.data.frame = TRUE)

View(df)

dr = df[,c(32,37,84,76,314,119,431,487,470,539 ,544,581,582,583,592,602,651,655,662,656)]

na.omit(dr)

View(dr)

ctrl = C5.0Control(sample = 0.7,
                   seed = 123,
                   winnow = T,
                   fuzzyThreshold = T,
                   CF = 0.4,
                   minCases = 6)


model= C5.0(dr[,-20],dr[,20],control = ctrl,trials=30)

summary(model)

plot(model,type="s",main="Decision Tree")
