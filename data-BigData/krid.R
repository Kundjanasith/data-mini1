
#file = read.csv('~/Desktop/ex_data.csv', header=TRUE)
#names(file)
#view(file)

install.packages("mosaic")
library(mosaic)
library(mosaicData)
data(diamonds)
head(diamonds)

library(ggplot2)
ggplot(data=diamonds)+
  geom_point(aes(x=depth, y=table))

ggplot(data=diamonds)+
  geom_point(aes(x=carat, y=price, color=color))+
  ggtitle("Graph Title")+
  xlab("")+
  ylab("")

