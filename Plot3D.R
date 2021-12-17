#Devin McMurrey, Assignment# 5 4/13/2021

setwd("C:/Users/DevinTheDude/Desktop/WDQMST5334")
#1 Load data set into R

library(readr)
#in class we will utilize read.table to produce data frames 
lfs <- loans_full_schema <- read_csv("loans_full_schema.csv")

#2 (make model 1 with 2 variables)

library(rgl)

plot3d(x= lfs$annual_income, y= lfs$interest_rate, z= lfs$loan_amount)

s2 <- lm(formula = interest_rate ~ annual_income + loan_amount, data = lfs)
summary(s2)

#The proportion of interest rate variability explained
#by the model is 2.04%

#3 Explanatory aspect : evaluate b1 to include 

s2$coefficients
#x1= 0.00001041 x2= 0.00005256
#y= 12.39 - 0.00001041x1 + 0.00005256x2

#The variable b1 does not predict variability well, but is statistically significant as p-value is < .01.
#The slope coefficient for b1 means for every $1 increase in annual income the interest rate 
#then decreases by 0.0000104%

#4 Predictive aspect: Evaluate goodness of fit of the Model 

#The model does not predict interest rate well. The residual standard error (typical error in prediction) of a 4.95% difference, in scale of interest rate, 
      #is very large range. For example, on a 8% loan +- ~5% is 3-13% interest rate would not help a loan officer or consumer evaluate the loan.
        #In a situation like this we would want residual standard error to be smaller maybe .5% to .25%. 
    #what does that mean 

#5 Model 2: Add predictor X3
#Estimate interest_rate = b0 + b1x1 + b2x2 + b3x3
s3 <- lm(formula = interest_rate ~ annual_income + loan_amount + total_credit_lines , data = lfs)
summary(s3)

s3$coefficients
#x1= 0.00001041 x2= 0.00005256 x3= 0.015869
#y= 12.68 - 0.00000991x1 + 0.0000548x2 - .015869x3

#The proportion of interest rate variability explained
#by the model is 2.174%

#Evaluate against Model 1 

#Residual standard error is slightly less at 4.947 and r^2 at .02174 is slightly higher.
# Thus, I find Model 2 more accurately predicts variability of the interest rate than model 1. 

#6 use best of 2 models an instance of new data. Specify prediction interval.

data.frame( AnnualIncome = lfs$annual_income, InterestRate = lfs$interest_rate, LoanAmount = lfs$loan_amount, TotalCreditLines = lfs$total_credit_lines, Pred_Fit=s3$fitted.values)

new1 <- data.frame(annual_income=30000,loan_amount=100000, total_credit_lines= 8)

predict(object = s3, newdata = new1, interval = "prediction")


