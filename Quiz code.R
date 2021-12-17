year <- c(2004,2005,2006,2007,2008)
Tbill <- c(1.58,3.39,4.81,4.44,1.62)
Inflation <- c(3.26,3.42,2.54,4.08,0.09)

poo<- data.frame(year,Tbill,Inflation)
poo

plot(x= poo$Tbill, y = poo$Inflation, pch=16)

D1<- lm(formula = Tbill ~ Inflation , data = poo )

abline(D1, col= "red")
summary(D1)



library(readr)
hw <- book1 <- read_csv("Book1.csv")

plot(x= hw$tbill, y= hw$inflation, pch = 16)
D2 <- lm(formula = Tbill ~ Inflation, data = hw)
abline(D2, col= "red")
summary(D2)summary(D1)

sqft <- c(1897,1157,1024,935,1236,1248,1620,1124)
price <- c(172,121,107,85,123,106,141,132)
pee <- data.frame(sqft,price)
pee
plot(x = pee$sqft, y = pee$price, pch = 16)
D3<- lm(formula = price ~ sqft , data = pee)

abline(D3, col= "red")
summary(D3)
confint(D3, level = 0.99)


#assignment 5 basics 

#i think lines 12-45 are unnecessary for assignment 5
#but ask professor about it 
plot(x= lfs$annual_income, y= lfs$interest_rate)

s1 <- lm(formula = interest_rate ~ annual_income , data = lfs )

abline(s1, col= "red")

summary(s1)

#The proportion of interest rate variability
#explained by model is 0.99% (slope is significant and evidence of negative relationship. as annual income increases, rate goes down.)

s1$coefficients
#x intercept = , y intercept = 
#(why is it saying annual income is negative when i can see it is around 13000?)
# for each additional dollar your interest rate is lowering by that amount 

s1$residuals

s1$fitted.values
#these fitted values correspond to interest rate  
# when you plug in x 

data.frame( AnnualIncome = lfs$annual_income, InterestRate = lfs$interest_rate, Pred_Fit=s1$fitted.values)
#compares difference in model and actual numbers ?
# should show predictive and actual values
# model does not do a good job, only predicts values between 10 & 12 no matter what actual value is 
# take numerical predictors

predict(object = s1)
s1$fitted.values
# two different ways to get predicted values..
#probably unnecessary for assignment

range(lfs$annual_income)
range(lfs$loan_amount)
# seem unnecessary but show range of values from
#IF WE GO OUTSIDE RANGE OF X WE ARE 
#EXTRAPOLATING WHICH CARRIES A LOT MORE ERROR
#WE HAVE NO IDEA OF REACTIONS OUTSIDE

s2$residuals
#show deviations from sample mean

s2$fitted.values
#show predictive values