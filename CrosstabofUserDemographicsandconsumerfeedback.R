setwd("C:/Users/DevinTheDude/Desktop/WDQMST5334")
library(readr)
plu <- Pigeon_Loans_User_Survey2021_1.csv <- read_csv("Pigeon_Loans_User_Survey2021_1.csv")
mrs <- Market_Research_Survey2021_1.csv <- read_csv("Market_Research_Survey2021_1.csv")

# What is the probability of a user from the Pigeon portfolio being a certain age range?
#marginal distribution for application type
age = plu$Please_specify_your_age_range.
table(plu$Please_specify_your_age_range.)
prop.table(table(plu$Please_specify_your_age_range.))
addmargins(prop.table(table(plu$Please_specify_your_age_range.)))

age_range = pie(table(plu$Please_specify_your_age_range.), main = "Customer Age Range", col = c("Red", "Blue", "Green","Yellow","Orange"))
# % chance of being a certain age 
  # 36-50 = 41.43%
  # 26-35 = 24.28%
  # 51-65 = 19.52%
  # 18-25 = 10.00%
  # 66+   = 4.76%

# what is the probability of a loan from the Pigeon portfolio being from someone with different levels of education?
ed = plu$`What_levels_of_education_you_have_completed?`
table(plu$`What_levels_of_education_you_have_completed?`)
prop.table(table(plu$`What_levels_of_education_you_have_completed?`))
addmargins(prop.table(table(plu$`What_levels_of_education_you_have_completed?`)))
round(addmargins(prop.table(table(ed,inc)))*100,2)
round(addmargins(prop.table(table(age,ed)))*100,2)
round(addmargins(prop.table(table(age,inc)))*100,2)
addmargins(prop.table(table(inc, plu$`Have_you_started_a_loan_on_Pigeon_Loans?`)))
#marginal distribution for education levels
# for those with multiple levels we will take highest level and add them together
  #High School Degree = 54.76% 
    .5476 # 54.76%
  # Bachelor's Degree= 16.35% 
      .14+.014+.0095
      .1635 # or 16.35%
  #Trade School = 16.19%
      .02857+.13333
        .1619 #or 16.19%
  #Master's Degree = 3.809%
        .03333+.00476
        .03809 #or 3.809%
  #Ph.D = 0.476%

# create a cross tabulation(contingency table or table of joint probabilities) for age and sex of user 
attach(plu)
table(Please_specify_your_age_range.,`What_is_your_sex?`)
addmargins(prop.table(table(Please_specify_your_age_range.,`What_is_your_sex?`)))

# marginal distribution for relationship of age to Gender 
#                               What_is_your_sex?
#Please_specify_your_age_range.      Female        Male        Non-binary   Nonbinary         Sum
#18_-_25_years_old                   0.028571429   0.057142857 0.009523810  0.004761905       0.100000000
#26_-_35_years_old                   0.138095238   0.104761905 0.000000000  0.000000000       0.242857143
#36_-_50_years_old                   0.276190476   0.138095238 0.000000000  0.000000000       0.414285714
#51_-_65_years_old                   0.100000000   0.095238095 0.000000000  0.000000000       0.195238095
#66+_years_old                       0.038095238   0.009523810 0.000000000  0.000000000       0.047619048
#Sum                                 0.580952381   0.404761905 0.009523810  0.004761905       1.000000000

#what is probability  of race ?
plu$`What_is_your_race_/_ethnicity?`
table(plu$`What_is_your_race_/_ethnicity?`)
prop.table(table(plu$`What_is_your_race_/_ethnicity?`))
round(sort(prop.table(table(plu$`What_is_your_race_/_ethnicity?`)), decreasing = TRUE),3)

# create a cross tabulation(contingency table or table of joint probabilities) for age and race of user 
attach(plu)
table(Please_specify_your_age_range.,`What_is_your_race_/_ethnicity?`)
addmargins(prop.table(table(Please_specify_your_age_range.,`What_is_your_race_/_ethnicity?`)))
# marginal distribution for relationship of age to ethnicity


#where do the reside ?
st = plu$`Where_do_you_currently_reside?`
table(plu$`Where_do_you_currently_reside?`)
prop.table(table(plu$`Where_do_you_currently_reside?`))
addmargins(prop.table(table(plu$`Where_do_you_currently_reside?`)))
sort(prop.table(table(plu$`Where_do_you_currently_reside?`)), decreasing = TRUE)*100
reside = pie(table(plu$`Where_do_you_currently_reside?`), main = "Customer State Residency")
#age vs state 
attach(plu)
table(Please_specify_your_age_range.,`Where_do_you_currently_reside?`)
round(addmargins(prop.table(table(Please_specify_your_age_range.,`Where_do_you_currently_reside?`)))*(100),2)
# marginal distribution for relationship of age to state

#state vs how they found you
attach(plu)
table(`Where_do_you_currently_reside?`,`Where_did_you_first_hear_about_us?`)
round(addmargins(prop.table(table(`Where_do_you_currently_reside?`,`Where_did_you_first_hear_about_us?`)))*(100),2)
# marginal distribution for relationship of state vs how they found you

#what is range of income last year  ?
inc = plu$`In_what_range_did_your_income_fall_last_year?`
table(plu$`In_what_range_did_your_income_fall_last_year?`)
prop.table(table(plu$`In_what_range_did_your_income_fall_last_year?`))
addmargins(prop.table(table(plu$`In_what_range_did_your_income_fall_last_year?`)))
sort(prop.table(table(plu$`In_what_range_did_your_income_fall_last_year?`)), decreasing = TRUE)


#how did you find out about pigeon loans 
plu$`Where_did_you_first_hear_about_us?`
table(plu$`Where_did_you_first_hear_about_us?`)
prop.table(table(plu$`Where_did_you_first_hear_about_us?`))
round(sort(prop.table(table(plu$`Where_did_you_first_hear_about_us?`)), decreasing = TRUE)*(100),2) 

# create a cross tabulation(contingency table or table of joint probabilities) for age and how they found you 
attach(plu)
table(Please_specify_your_age_range.,`Where_did_you_first_hear_about_us?`)
round(addmargins(prop.table(table(Please_specify_your_age_range.,`Where_did_you_first_hear_about_us?`)))*(100),2)
# marginal distribution for relationship of age to how they were referred 

#why did they borrow money 
plu$`Why_did_you_want_to_borrow_money_from_someone?`
table(plu$`Why_did_you_want_to_borrow_money_from_someone?`)
prop.table(table(plu$`Why_did_you_want_to_borrow_money_from_someone?`))
round(sort(prop.table(table(plu$`Why_did_you_want_to_borrow_money_from_someone?`)), decreasing = TRUE)*(100),2)

#why did you come to pigeon loans 
plu$`Why_did_you_come_to_Pigeon_Loans?`
table(plu$`Why_did_you_come_to_Pigeon_Loans?`)
round(sort(prop.table(table(plu$`Why_did_you_come_to_Pigeon_Loans?`)), decreasing = TRUE)*(100),2)
table(Please_specify_your_age_range.,`Why_did_you_come_to_Pigeon_Loans?`)
round(addmargins(prop.table(table(Please_specify_your_age_range.,`Why_did_you_come_to_Pigeon_Loans?`)))*(100),2)
# marginal distribution for relationship of age to how they were referred 

#did they have someone in mind to start a lone with before and after ?
plu$`Before_you_came_to_Pigeon_Loans,_did_you_have_someone_in_mind_with_whom_you_wanted_to_start_a_loan_with?`
table(plu$`Before_you_came_to_Pigeon_Loans,_did_you_have_someone_in_mind_with_whom_you_wanted_to_start_a_loan_with?`)
prop.table(table(plu$`Before_you_came_to_Pigeon_Loans,_did_you_have_someone_in_mind_with_whom_you_wanted_to_start_a_loan_with?`))
round(addmargins(prop.table(table(Please_specify_your_age_range.,`Before_you_came_to_Pigeon_Loans,_did_you_have_someone_in_mind_with_whom_you_wanted_to_start_a_loan_with?`)))*(100),2)
round(addmargins(prop.table(table(age,`After_you_came_to_Pigeon_Loans,_did_you_have_someone_in_mind_with_whom_you_wanted_to_start_a_loan_with?`)))*(100),2)

#if they had to guess who would they start a loan 
plu$`Have_you_started_a_loan_on_Pigeon_Loans?`
round(addmargins(prop.table(table(Please_specify_your_age_range.,`Have_you_started_a_loan_on_Pigeon_Loans?`)))*(100),2)


# if they have shared pigeon loans or plan to in the future 
plu$`Have_you_shared_Pigeon_Loans_with_anyone_you_know?`
round(addmargins(prop.table(table(Please_specify_your_age_range.,`Have_you_shared_Pigeon_Loans_with_anyone_you_know?`)))*(100),2)
#will you share it 
plu$`In_the_future_I_will_share_Pigeon_Loans_with_someone_I_know:`
round(addmargins(prop.table(table(age,`In_the_future_I_will_share_Pigeon_Loans_with_someone_I_know:`)))*(100),2)

#favorite feature 
plu$`What_are_your_favorite_features_of_Pigeon_Loans?`
table(plu$`What_are_your_favorite_features_of_Pigeon_Loans?`)
round(sort(prop.table(table(plu$`What_are_your_favorite_features_of_Pigeon_Loans?`)), decreasing = TRUE)*(100),2)
    #this was an open ended answer or a multiple option choice. It yielded an extremely wide permutation of similar answers. most common was contract generation, payment portal 
    
#what they wish it had 
plu$`What_do_you_wish_Pigeon_Loans_had?`
table(plu$`What_do_you_wish_Pigeon_Loans_had?`)
round(sort(prop.table(table(plu$`What_do_you_wish_Pigeon_Loans_had?`)), decreasing = TRUE)*(100),2)

#in the past 3 years have you lent money / borrow / greater than 100$

mrs$`How_much_money_do_you_think_a_person_would_lend_to_their_friends,_family,_or_acquaintances_in_one_loan?`
table(mrs$`How_much_money_do_you_think_a_person_would_lend_to_their_friends,_family,_or_acquaintances_in_one_loan?`)
round(sort(prop.table(table(mrs$`How_much_money_do_you_think_a_person_would_lend_to_their_friends,_family,_or_acquaintances_in_one_loan?`)), decreasing = TRUE)*(100),2)

#times you borrowed money, who lent it to you
mrs$`The_times_when_you_have_lent_money,_who_did_you_lend_it_to?`
round(sort(prop.table(table(mrs$`The_times_when_you_have_lent_money,_who_did_you_lend_it_to?`)), decreasing = TRUE)*(100),2)

# in the past 3,2,1 years how many times have you lent money 
mrs$`In_the_past_3_years,_how_many_times_have_you_lent_money_to_friends,_family,_acquaintances,_or_strangers?`
round(sort(prop.table(table(mrs$`In_the_past_3_years,_how_many_times_have_you_lent_money_to_friends,_family,_acquaintances,_or_strangers?`)), decreasing = TRUE)*(100),2)
round(sort(prop.table(table(mrs$`In_the_past_2_years,_how_many_times_have_you_lent_money_to_friends,_family,_acquaintances,_or_strangers?`)), decreasing = TRUE)*(100),2)
round(sort(prop.table(table(mrs$`In_the_past_year,_how_many_times_have_you_lent_money_to_friends,_family,_acquaintances,_or_strangers?`)), decreasing = TRUE)*(100),2)

#past 3 years have you lent money 
mrs$`If_applicable,_in_the_past_3_years,_have_you_lent_money_to,_or_borrowed_money_from,_friends,_family,_or_acquaintances_(greater_than_$100):`
round(sort(prop.table(table(mrs$`If_applicable,_in_the_past_3_years,_have_you_lent_money_to,_or_borrowed_money_from,_friends,_family,_or_acquaintances_(greater_than_$100):`)), decreasing = TRUE)*(100),2)

# on average how much money have you lent to friends 
attach(mrs)
mrs$`On_average,_how_much_money_have_you_lent_to_friends,_family,_acquaintances,_or_strangers_each_time_you_lent_them_money?`
round(sort(prop.table(table(mrs$`On_average,_how_much_money_have_you_lent_to_friends,_family,_acquaintances,_or_strangers_each_time_you_lent_them_money?`)), decreasing = TRUE)*(100),2)

#biggest worry 
mrs$`In_the_case_of_a_loan_between_friends,_friends,_family,_acquaintances,_or_strangers,_what_would_worry_you_the_most?`
round(sort(prop.table(table(mrs$`In_the_case_of_a_loan_between_friends,_friends,_family,_acquaintances,_or_strangers,_what_would_worry_you_the_most?`)), decreasing = TRUE)*(100),2)

#why did you lend money
mrs$`When_you_lent_money_in_the_past,_why_did_you_do_it?`
round(sort(prop.table(table(mrs$`When_you_lent_money_in_the_past,_why_did_you_do_it?`)), decreasing = TRUE)*(100),2)      

#most stressful part  - the most frustrating part was opening ended 
mrs$`In_your_experience,_what_have_you_found_to_be_the_most_frustrating__part_of_lending_money_to_friends,_family,_acquaintances,_or_strangers?`
mrs$`The_most_stressful_or_upsetting_part_of_lending_money_to_friends,_family,_acquaintances,_or_strangers_is_not_getting_paid_back_in_full.`
round(sort(prop.table(table(mrs$`The_most_stressful_or_upsetting_part_of_lending_money_to_friends,_family,_acquaintances,_or_strangers_is_not_getting_paid_back_in_full.`)), decreasing = TRUE)*(100),2)

#most upsetting is damaging relationships
attach(mrs)
mrs$`The_most_stressful_or_upsetting_part_of_lending_money_to_friends,_family,_acquaintances,_or_strangers_is_damaging_the_relationship.`
dmr = `The_most_stressful_or_upsetting_part_of_lending_money_to_friends,_family,_acquaintances,_or_strangers_is_damaging_the_relationship.`
ngpb = `The_most_stressful_or_upsetting_part_of_lending_money_to_friends,_family,_acquaintances,_or_strangers_is_not_getting_paid_back_in_full.`
round(sort(prop.table(table(mrs$`The_most_stressful_or_upsetting_part_of_lending_money_to_friends,_family,_acquaintances,_or_strangers_is_damaging_the_relationship.`)), decreasing = TRUE)*100,2)
round(addmargins(prop.table(table(dmr,ngpb)))*100,2)
round(addmargins(prop.table(table(ngpb,age)))*100,2)

#knowing laws 
mrs$`The_most_stressful_or_upsetting_part_of_lending_money_to_friends,_family,_acquaintances,_or_strangers_is_knowing_the_laws_about_making_loans_with_friends,_family,_acquaintances,_or_strangers.`
ktl = mrs$`The_most_stressful_or_upsetting_part_of_lending_money_to_friends,_family,_acquaintances,_or_strangers_is_knowing_the_laws_about_making_loans_with_friends,_family,_acquaintances,_or_strangers.`
round(addmargins(prop.table(table(ktl)))*100,2)
round(addmargins(prop.table(table(ktl,ngpb)))*100,2)
round(addmargins(prop.table(table(ktl,dmr)))*100,2)
#agreement on terms 
mrs$`The_most_stressful_or_upsetting_part_of_lending_money_to_friends,_family,_acquaintances,_or_strangers_is_coming_to_an_agreement_on_the_terms_of_the_loan_(including_repayment_schedule,_interest,_etc).`
aot = mrs$`The_most_stressful_or_upsetting_part_of_lending_money_to_friends,_family,_acquaintances,_or_strangers_is_coming_to_an_agreement_on_the_terms_of_the_loan_(including_repayment_schedule,_interest,_etc).`
round(addmargins(prop.table(table(aot)))*100,2)
round(addmargins(prop.table(table(aot,ktl)))*100,2)
#keeping track of payments 
top = mrs$`The_most_stressful_or_upsetting_part_of_lending_money_to_friends,_family,_acquaintances,_or_strangers_is_keeping_track_of_payments.`
round(sort(prop.table(table(top)), decreasing = TRUE)*100,2)
round(addmargins(prop.table(table(top,aot)))*100,2)

#how much would you pay for a service to facilitate and manage these loans 
pfm = mrs$`How_much_would_someone_pay_every_month_for_a_service_that_facilitates_and_manages_their_loans_between_friends,_family,_acquaintances,_or_strangers_(in_USD)?`
round(prop.table(table(pfm))*100,3)
# how much would you pay for a service that maintains a good relationship between them and the borrower or lender ?
mgr = mrs$`How_much_would_someone_pay_every_month_for_a_service_that_maintains_a_good_relationship_between_them_and_the_person_they_have_borrowed_money_from_or_lent_money_to_(in_USD)?`
round(prop.table(table(mgr))*100,3)
#how much would people pay for service that helps come to agreement on terms 
cta= mrs$`How_much_would_someone_pay_every_month_for_a_service_that_helps_them_come_to_an_agreement_on_the_terms_of_the_loans_they_are_setting_up_(in_USD)?`
round(prop.table(table(cta))*100,2)
#hmwup to keep track of payments 
ktp = mrs$`How_much_do_you_think_someone_would_pay_every_month_for_a_service_that_helps_you_better_track_payments_during_the_course_of_the_loan_(in_USD)?`
round(prop.table(table(ktp))*100,2)
#hmwup to help pay back people in full 
ppf = mrs$`How_much_would_someone_pay_every_month_for_a_service_that_helps_them_pay_back_a_loan_in_full_to_their_friends,_family,_acquaintances,_or_strangers_(in_USD)?`
round(prop.table(table(ppf))*100,2)

pay_data <- data.frame(fac_manage= pfm, 
                       relationship= mgr, 
                       agreeterms= cta,
                       trackpay= ktp,
                       payback= ppf)
                       

pairs(pay_data)
cor(pay_data)

#what features would make people most excited about pigeon loans 
fet = mrs$`What_features_in_a_potential_service_do_you_think_people_would_be_most_excited_about_regarding_loans?`
round(sort(prop.table(table(fet)), decreasing = TRUE)*100,2)

plu_data <- data.frame(age_demo = age,
                       income = inc,
                       state = st,
                       education = ed)
pairs(plu_data)
cor(plu_data)
