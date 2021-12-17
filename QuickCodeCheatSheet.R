x = 2 
x
x ==2
x
paste("apple", "pie")
## [1] "apple pie"

max(abs(c(-5,1,5)))
x <- data.frame(z = 1:2)
x
y <- data.frame(z=3)
join(x,y)
c(x,y)
x+y
rbind(x,y)
x <-data.frame(y = 1:10)
x
subset(x,y>5)
x[y>5]
x[y>5,]
x[which(x$y >5),]
x$y >5
fruit <-"apple"
fruit
x<-2
class(x)
length(x)
x<- c(1,2,3)
class(x
      )
length(x)
fruit<-"apple"
class(fruit)
length(fruit)
nchar(fruit)
fruits<- c("apple", "banana", 'strawberry')
length(fruits)
nchar(fruits)
fruits[2]
fruits[0]
paste('key','lime','pie')
x<- c(1,"apple",3)
x[1]
x[2]
list(1,'apple',3) [[1]]
list(1,'apple',3) [[2]]
list(1,'apple',3) [[3]]


mydata<- data.frame(site = c('A','B','C'),
                    temp = c(20,30,40))
mydata
cardf = read.csv("Cars93.csv")
cardf
nrow(cardf)
cardf$Model
unique(cardf$Model)
cardf[order(cardf$Model),]
cardf[1,]
cardf[,1]
cardf[1,1]
cardf[c(1,5),]
cardf$Make
?order
order(c(1,2,3))
order(c(3,2,1))
order(mydata$temp)
order(cardf$Price)
cardf[cardf$Manufacturer == "Ford",]
cardf$Manufacturer == "Ford"
subset(cardf, Manufacturer == "Ford")
str(cardf)
summary(cardf)
library(ggplot2)
data("diamonds")
diamonds
head(diamonds)
tail(diamonds)
plot(price ~ carat, data = diamonds)
mod <- lm(price~ carat, data = diamonds)
summary(mod)
abline(mod$coefficients[[1]], mod$coefficients[[2]], col = 'red', lwd = 8)
