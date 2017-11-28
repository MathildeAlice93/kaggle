# Add column weekday and month to the train dataset
train_DS$weekday <- weekdays(as.Date(train_DS$date), abbreviate= TRUE)
train_DS$month <- substr(train_DS$date,6,7)
train_DS <- subset( train_DS, select = -month )





  size_Batch <- 10

  ProductMax <- nrow(items_DS)
  ProductBgn <- 1
  ProductEnd <- 10
  Items_Summary <- NULL
  
    while(ProductEnd < ProductMax)
    {
      
      items_Nbr <- items_DS$item_nbr[ProductBgn:ProductEnd]
      Subset_train <- train_DS[train_DS$item_nbr %in% items_Nbr,]
      #Add date variables
      Subset_train$month <- substr(Subset_train$date,6,7)
      Subset_train$weekday <- weekdays(as.Date(Subset_train$date), abbreviate= TRUE)
      
      Items_Summary_Int <- Subset_train %>%
        group_by(item_nbr,weekday) %>% 
        summarize(Sum_units = sum(unit_sales)/n()) %>%
        spread(weekday, Sum_units) 
      
      Items_Summary_Int <- Items_Summary_Int[, c(1,4,5,6,3,8,7,2)]
      
      Sum_Total <-
        Subset_train %>%
        group_by(item_nbr) %>%
        summarize(sum_total = sum(unit_sales)/n())
      
      Items_Summary_Int <- left_join(Items_Summary_Int, Sum_Total, by="item_nbr")
      
      Items_Summary <- rbind(Items_Summary, Items_Summary_Int)
      
      ProductBgn <- ProductBgn + size_Batch
      ProductEnd <- ProductEnd + size_Batch
    }
  
  items_Nbr <- items_DS$item_nbr[ProductBgn:ProductMax]
  Subset_train <- train_DS[train_DS$item_nbr %in% items_Nbr,]
  #Add date variables
  Subset_train$month <- substr(Subset_train$date,6,7)
  Subset_train$weekday <- weekdays(as.Date(Subset_train$date), abbreviate= TRUE)
  
  Items_Summary_Int <- Subset_train %>%
    group_by(item_nbr,weekday) %>% 
    summarize(Sum_units = sum(unit_sales)/n()) %>%
    spread(weekday, Sum_units) 
  
  Items_Summary_Int <- Items_Summary_Int[, c("item_nbr","lun.","mar.","mer.","jeu.","ven.","sam.","dim.")]
  
  Sum_Total <-
    Subset_train %>%
    group_by(item_nbr) %>%
    summarize(sum_total = sum(unit_sales)/n())
  
  Items_Summary_Int <- left_join(Items_Summary_Int, Sum_Total, by="item_nbr")   
  
  Items_Summary <- rbind(Items_Summary, Items_Summary_Int)
  
  Items_Summary$lun. <- Items_Summary$lun./Items_Summary$sum_total
  Items_Summary$mar. <- Items_Summary$mar./Items_Summary$sum_total
  Items_Summary$mer. <- Items_Summary$mer./Items_Summary$sum_total
  Items_Summary$jeu. <- Items_Summary$jeu./Items_Summary$sum_total
  Items_Summary$ven. <- Items_Summary$ven./Items_Summary$sum_total
  Items_Summary$sam. <- Items_Summary$sam./Items_Summary$sum_total
  Items_Summary$dim. <- Items_Summary$dim./Items_Summary$sum_total
  
  
  
  
  
  
  #########################"" Cluster results #########################################
  Items_Summary_Cluster <- Items_Summary[, c(-9)]
  
  
  Items_Summary_Cluster[is.na(Items_Summary_Cluster)] <- 0
  
  Nb_Cluster <- 50
  
  Tot_Sum_Square <- matrix(nrow = 50, ncol = 2)
  
  
  for(i in 1:Nb_Cluster)
  {
    # Kmeans with high totss
    best_result_kmeans <- kmeans( Items_Summary_Cluster[,c(-1)],1)
    # Heuristic algorithm so we have to repeat several times the clustering
    for(j in 1:100)
    {
        result_kmeans <- kmeans(Items_Summary_Cluster[,c(-1)],i)
        result_kmeans$tot.withinss
        if(result_kmeans$tot.withinss < best_result_kmeans$tot.withinss)
        {
          best_result_kmeans <- result_kmeans
        }
    }
    Tot_Sum_Square[i,1] <- i
    Tot_Sum_Square[i,2] <- best_result_kmeans$tot.withinss
  }
  Tot_Sum_Square <- as.data.frame(Tot_Sum_Square) 
  
colnames(Tot_Sum_Square) <- c("Number","Tot_Sum_SS")

ggplot(Tot_Sum_Square, aes(Number,Tot_Sum_SS)) + geom_bar(stat = "identity") 
#+ scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x), labels =trans_format("log10",math_format(10^.x)))
  
  
  
for(j in 1:100)
{
  result_kmeans <- kmeans( Items_Summary_Cluster,10)
  result_kmeans$tot.withinss
  if(result_kmeans$tot.withinss < best_result_kmeans$tot.withinss)
  {
    best_result_kmeans <- result_kmeans
  }
}
  
  
  
  
  
  
  items_Nbr <- items_DS$item_nbr[ProductBgn:ProductMax]
  Subset_train <- train_DS[train_DS$item_nbr %in% items_Nbr,]
  #Add date variables
  Subset_train$month <- substr(Subset_train$date,6,7)
  Subset_train$weekday <- weekdays(as.Date(Subset_train$date), abbreviate= TRUE)
  
  Items_Summary_Int <- Subset_train %>%
    group_by(item_nbr,weekday) %>% 
    summarize(Avg_units = mean(unit_sales),
              Sum_units = sum(unit_sales),
              nbr=n())
  
  Items_Summary <- rbind(Items_Summary, Items_Summary_Int)
  

  Items_nbr_date_sum <- train_DS_1_1000 %>%
    group_by(item_nbr) %>% 
    summarize(Sumx = sum(unit_sales))
  
  x <- left_join(Items_nbr_date,Items_nbr_date_sum, by='item_nbr')
  x$percentage <- x$Sum_units/x$Sumx 
  
  
  
  
  
  
  
  fileNamedx <- paste0(fileName, "-", ProductBgn, "-", ProductMax)
  
}


Items_Summary_Int <- Subset_train %>%
  group_by(item_nbr,weekday) %>% 
  summarize(Sum_units = sum(unit_sales)/n()) %>%
  spread(weekday, Sum_units) 
  
Items_Summary_Int <- Items_Summary_Int[, c(1,4,5,6,3,8,7,2)]
            
Sum_Total <-
  Subset_train %>%
      group_by(item_nbr) %>%
        summarize(sum_total = sum(unit_sales)/n())
  
Items_Summary_Int <- left_join(Items_Summary_Int, Sum_Total, by="item_nbr")    













for (i in 1:(nrow(items_DS)/size_Batch))
{
    items_DS_1_1000 <- items_DS$item_nbr[1:10]
}























items_DS_1_1000 <- items_DS$item_nbr[1:10]
train_DS_1_1000$month <- substr(train_DS_1_1000$date,6,7)

train_DS_1_1000 <- train_DS[train_DS$item_nbr %in% items_DS_1_1000,]
train_DS_1_1000$weekday <- weekdays(as.Date(train_DS_1_1000$date), abbreviate= TRUE)

Items_nbr_date <- train_DS_1_1000 %>%
  group_by(item_nbr,weekday) %>% 
  summarize(Avg_units = mean(unit_sales),
            Sum_units = sum(unit_sales),
            nbr=n())

Items_nbr_date_sum <- train_DS_1_1000 %>%
  group_by(item_nbr) %>% 
  summarize(Sumx = sum(unit_sales))

x <- left_join(Items_nbr_date,Items_nbr_date_sum, by='item_nbr')
x$percentage <- x$Sum_units/x$Sumx

plot(Items_nbr_date$weekday,Items_nbr_date)
  
  
rm(sample_DS)

gc()
rm(train_DS)


ggplot(x, aes(weekday, percentage))+ geom_point()+facet_wrap(~ item_nbr)




