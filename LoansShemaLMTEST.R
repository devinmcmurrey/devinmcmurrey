#McMurrey,Devin 4/28/2021, Assignment 6 

setwd("C:/Users/DevinTheDude/Desktop/WDQMST5334")

#1 Load data set into R
library(readr)
lfs <- loans_full_schema <- read_csv("loans_full_schema.csv")
#Separate data by states (elements)
#2 Create a linear model that represents the relationship of interest rate of loan and potential predictors for a state other than Texas. 
lfs.s <- split(x = lfs, f = lfs$state)
lfs.s$FL$homeownership <- as.factor(lfs.s$FL$homeownership)
lfs.s$FL$homeownership
plot( x = lfs.s$FL$homeownership, y = lfs.s$FL$interest_rate)

#3 4 predictors use ANCOVA

s1 <- lm(formula = interest_rate ~ homeownership + loan_amount + total_credit_limit + annual_income , data = lfs.s$FL)
summary(s1)

#r^2 = 0.05116
#4.711% standard error

#is intercept statistically significant ?
#yes it is p value is  nearly 0 

#12.69 represents the interest rate within the context of the problem 
#-0.8377 & 0.4218 represent the slope for owning & renting 
#home ownership mortgage = 12.69 -0.548 (0)= 12.69%
#home ownership own = 12.69 - 0.84 (1)= 11.85%
#home ownership rent= 12.69 + 0.42(1)= 13.11 %


#4 explanatory aspect

plot(x = lfs.s$FL$loan_amount, y = lfs.s$FL$interest_rate, col = lfs.s$FL$homeownership)
#This plot gives a visual of the different levels of the categorical variable. 
#now we know which points represent Mortgage/Own/Rent as
#Mortgage is black , Own is red , Rent is green.

s1$coefficients
#home ownership mortgage y= 12.69 + 0.00008635x1 - 0.00000212x2 - 0.0000133x3
#home ownership own y = 11.8523 + 0.00008635x1 - 0.00000212x2 - 0.0000133x3
#home ownership rent y = 13.1118 + 0.00008635x1 - 0.00000212x2 - 0.0000133x3

#does not work well 
#some predictors are significant, total credit limit not significant, 
#home ownership own not significant, rent not significant  

abline(a= 12.69, b = 0.00008635, col = "blue") #mortgage
abline(a = (12.69 - 0.8377), b = 0.00008635, col = "yellow") #own
abline(a = (12.69 + 0.4218), b = 0.00008635, col = "orange") #rent

#Information about home ownership-mortgage is contained in the intercept 
#home ownership-own caused interest rate to diminish by 0.8377% but is not statistically significant
#home ownership - rent cause interest rate to increase by 0.4218% but is not statistically significant   
#as annual income increases interest rate decreases 0.0000133% 
#as loan amount increases interest rate increases by 0.00008635%
#as total credit limit increases the interest rate decreases by 0.000002124% but is not statistically significant 
#Results make sense but home ownership does not explains much of variability between 3 cases 

#5 Diagnose the model using Gauss-Markov Theorem, normality and Multicollinearity

#mean residuals is zero?
mean(s1$residuals)
#yes 

#heteroscedasticity
library(lmtest)
bptest(formula = s1, studentize = TRUE)
#p value < 0.05 indicates we reject the null hypothesis 
#we can see there is not constant variance or homoscedasticity 
#there evidence is heteroscedasticity
    # the variance of y given x is not constant 
      #shows we cant rely on std error, t value or p value
plot(s1$residuals)#residual plot indicates heteroscedasticity also

#serial correlation
dwtest(formula = s1, alternative = "two.sided")
# p value is > .05
  #reject null hypothesis,
    #there is serial correlation



#residuals are Gaussian?

shapiro.test(x = s1$residuals)
#we reject null hypothesis . p value = 0.00000000005885
# evidence of data not being Gaussian 

hist(s1$residuals)
#visual representation of data 
#Multicollinearity 

library(car)
vif(mod = s1)
#Home Ownership inflates the standard error 1.34x, or about 34%.
#Loan amount inflates the standard error 1.25x, or about 25%.
#total credit limit inflates the standard error 1.8x, or about 80%.
#annual income inflates the standard error 1.61x, or about 61%. 
#Given the GVIF's are less and 5 we assume their is not multicollinearity.
#Generalized Variance Inflation Factor
 
