#McMurrey, Devin 3.22.2021 Assignment 4: Correlation

setwd("C:/Users/DevinTheDude/Desktop/WDQMST5334")
#1 Load data set into R
library(readr)
#in class we will utilize read.table to produce data frames 
lfs <- loans_full_schema <- read_csv("loans_full_schema.csv")

#2Create Scatter plot matrix for variables 

lfs$annual_income[lfs$state=="TX"]
a = lfs$interest_rate[lfs$state=="TX"]
new_data <- data.frame(Interest_Rate=lfs$interest_rate[lfs$state=="TX"], 
                       Annualc_Income= lfs$annual_income[lfs$state=="TX"], 
                       Total_credit_limit=lfs$total_credit_limit[lfs$state=="TX"],
                       Loan_amount=lfs$loan_amount[lfs$state=="TX"],
                       Num_satisfactory_Account=lfs$num_satisfactory_accounts[lfs$state=="TX"],
                       Num_active_debit_accounts=lfs$num_active_debit_accounts[lfs$state=="TX"])

pairs(new_data)
cor(new_data)

#3 Test the Pearson correlation coefficient between interest rate and annual income for the loans in the state of Texas 

cor.test(x= new_data$Interest_Rate, y = new_data$Annualc_Income, alternative = "two.sided", conf.level = .99)

#Pearson's product-moment correlation

#data:  new_data$Interest_Rate and new_data$Annualc_Income
#t = -4.2693, df = 804, p-value = 2.195e-05
#alternative hypothesis: true correlation is not equal to 0
#99 percent confidence interval:
#-0.23634890, -0.05903662
#sample estimates:
#cor = -0.1488893 

#3 (answer) With a p-value (well below)< .001 we can conclude that these levels 
#are highly statistically significant. Furthermore with, P= <0.001 - 
# our conclusion of hypothesis rejects the null hypothesis 
#and we have found evidence of 
#a relationship between interest rate and gas annual income.

#4 Test the Pearson correlation coefficient between interest rate and annual income for loans in the state of Texas 
cor.test(x= new_data$Interest_Rate, y = new_data$Annualc_Income, alternative = "two.sided")

#Pearson's product-moment correlation

#data:  new_data$Interest_Rate and new_data$Annualc_Income
#t = -4.2693, df = 804, p-value = 2.195e-05
#alternative hypothesis: true correlation is not equal to 0
#95 percent confidence interval:
#-0.21572685, -0.08066313
#sample estimates:
#cor = -0.1488893 

#4. Estimate correlation coefficient off of confidence interval 
# 95% [-.2157,-.08066]
#4 answer
#The scale of correlation coefficient goes from -1 to 1, 
#this range is contained on left side of zero 
#Thus we are 95% confident that P(ro) correlation for all readings in Texas
#in Lending Clubs customer base lies in that interval. 
#So there is a correlation between annual income and and interest rate because
#0 is not a possibility, in the 95% confidence interval.
#The range is self contained below zero
# and is negative, so the correlation will be negative.
#We don't care about -.14889 anymore.

