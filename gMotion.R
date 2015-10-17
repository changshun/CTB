library(googleVis)
library(reshape2)
library(data.table)

data <- data.table(CTB)

by.QRT<- data[,.(count=.N, size=sum(Size)),by=.(QRT.Public, Prov)]

M1 <- gvisMotionChart(by.QRT, idvar="Prov", timevar="QRT.Public")

onMKT<-data[State=="上市"]
