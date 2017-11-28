
## load datasets - Be careful because the file "test" is 5 GB. Take a sample ? 
## Load packages
source("2 - CSF_Packages.R")
Load_Packages_CSF()

source("1 - CSF_Data importation.R") 



summary(train_DS)


Sum_onpromotion <-train_DS %>%
                    group_by(item_nbr) %>%
                    summarize(itemQuantity_sum = sum(unit_sales),
                      itemQuantityreturn_sum = sum(if(unit_sales<0){unit_sales}),
                      onpromotion_False = sum(onpromotion == 'False'),
                      onpromotion_True =sum(onpromotion == 'True'))
                 
                 
Sum_onpromotion$percentage_Onpromotion <- percent(Sum_onpromotion$onpromotion_True/
  (Sum_onpromotion$onpromotion_True+Sum_onpromotion$onpromotion_False))                

Sum_onpromotion <-train_DS %>%
  group_by(item_nbr, onpromotion) %>%
  summarize(itemQuantity_avg = mean(unit_sales))


Data_96995 <- train_DS[item_nbr =='96995',]

days<-c("mon","tue","wed","thu","fri","sat","sun") 
for(i in 1:7) 
  {
    Data_96995$day[==i]<-days[[i]] 
  }
substrRight(Data_96995$date,2)



train_DS_M <- merge(train_DS, stores_DS, by ="store_nbr")

train_DS_M$day <- weekdays(as.Date(train_DS_M $date))

summary(lm(train_DS_M$unit_sales ~ as.factor(train_DS_M$day)+ as.factor(train_DS_M$type)))



oil_DS$date <- as.character(oil_DS$date)

train_DS_M <- merge(train_DS_M, oil_DS, by ='date')

head(train_DS_M)
rm(train_DS)

reg <- lm(train_DS_M$unit_sales ~ train_DS_M$price + as.factor(train_DS_M$type))

