ws <- read.table(file = "whiteside.cvs", header= TRUE, sep = ",")

library(readr)

ws <- whiteside <- read_csv("whiteside.csv")


plot(x = ws$Temp, y = ws$Gas)

num_var <- data.frame(Temperature=ws$Temp, GasConsumption=ws$Gas)

pairs(num_var)

cor(num_var)

cor.test(x = num_var$Temperature, y = num_var$GasConsumption,alternative= "two.sided")
cor.test(x = ws$Temp, y=ws$Gas,alternative = "two.sided")

#for texas (total population is 3,000,000 but for sample 800)
#x, y 
#annual income , interest rate
# H0= P (ro) equals full sample correllation of 3,000,000
# P= 0 means no correlation 
#Halternative P (not equal)=0
#run test 

#if not zero then there is a correlation

#4. estimate correlation coefficient off of confidence interval 
# 95% [-.80,-.51]
#scale of correlation coefficent goes form -1 to 1 
#this is contained on left side of zero 
# we are 95% confident that P(ro) correlation for all readings in s/e england 
#in the 1960's  lies in that interval 
#so there is a correlation between gas and tempture bc 0 is not a possibility, interval
# is self contained below zero
# bc its negative the correlation is negative
# we dont care about -.68 anymore.

#how to split out texas with braket notation 

library(readr)
#in class we will utilize read.table to produce data frames 
lfs <- loans_full_schema <- read_csv("loans_full_schema.csv")

lfs$annual_income[lfs$state=="TX"]
lfs$interest_rate[lfs$state=="TX"]
new_data <- data.frame(Annualc_Income= lfs$annual_income[lfs$state=="TX"],
                       Interest_Rate=lfs$interest_rate[lfs$state=="TX"], 
                       Total_credit_limit=lfs$total_credit_limit[lfs$state=="TX"])

pairs(new_data)
cor(new_data)
cor(x= new_data$Annualc_Income, y = new_data$Interest_Rate)
cor.test(x= new_data$Annualc_Income, y = new_data$Interest_Rate, conf.level = .99)

install.packages("ggpubr")
library("ggpubr")
