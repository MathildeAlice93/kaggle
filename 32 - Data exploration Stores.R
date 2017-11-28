# Merge the datasets transactions_DS with the stores_DS dataset

tranAndStores_DS <- merge(transactions_DS, stores_DS, by ="store_nbr")

# Bar chart (state, year, nb_transactions)
Tran_Per_State <- tranAndStores_DS %>%
                    group_by(state) %>%
                    summarize(nbr_transactions = sum(transactions)) %>%
                    arrange(nbr_transactions)

Tran_Per_State_year <- tranAndStores_DS %>%
  group_by(state, year = substr(date,1,4)) %>%
  summarize(nbr_transactions = sum(transactions))


Tran_Per_State %>%
  ggplot(aes(state, nbr_transactions)) 

## Number de transactions per state
Tran_Per_State %>%
  ggplot(aes(x = reorder(state, -nbr_transactions), y = nbr_transactions)) + geom_bar(stat = "identity")

## Number de transactions per state
Tran_Per_State_year %>%
  ggplot(aes(x = year, y = nbr_transactions)) + geom_bar(stat = "identity") + facet_grid(.~state)


################################ Bar chart (cluster, year, nb_transactions) #################################
Tran_Per_Cluster <- tranAndStores_DS %>%
  group_by(cluster, year = substr(date,1,4)) %>%
  summarize(nbr_transactions = sum(transactions)) %>%
  arrange(nbr_transactions)

Tran_Per_Cluster %>%
  ggplot(aes(x = cluster, y = nbr_transactions)) + geom_bar(stat = "identity")

Tran_Per_Cluster %>%
  ggplot(aes(x = cluster, y = nbr_transactions)) + geom_bar(stat = "identity") + facet_grid(.~year)

Tran_Per_Cluster %>%
  ggplot(aes(x = year, y = nbr_transactions)) + geom_bar(stat = "identity") + facet_grid(.~cluster)

################################ Bar chart (type, year, nb_transactions) #################################
Tran_Per_Type <- tranAndStores_DS %>%
  group_by(type, year = substr(date,1,4)) %>%
  summarize(nbr_transactions = sum(transactions)) %>%
  arrange(nbr_transactions)

Tran_Per_Type %>%
  ggplot(aes(x = type, y = nbr_transactions)) + geom_bar(stat = "identity")

Tran_Per_Type %>%
  ggplot(aes(x = type, y = nbr_transactions)) + geom_bar(stat = "identity") + facet_grid(.~year)

Tran_Per_Type %>%
  ggplot(aes(x = year, y = nbr_transactions)) + geom_bar(stat = "identity") + facet_grid(.~type)


################################## Mapping map #########################################
lat <-  c(-0.1807, -0.2389, 0.0367141, -0.9316, -1.6636, 0.3516889, -1.5905, -1.4924, -1.2543, -2.1710, -2.227827,
          -1.8622, -1.8019, -1.0225, -2.6285, -2.2347644, -2.9001, -4.0079, -3.2581,  0.98333, -0.9677, -0.2714) 

lng <- c(-78.4678, -79.1774, -78.1507, -78.6058, -78.6546, -78.1222, -78.9995, -78.0024, -78.6229, -79.9224, -80.9585,   
         -79.9777, -79.5346, -79.4604, -80.3896, -80.9002, -79.0059, -79.2113, -79.9554, -79.65, -80.7089, -79.4648)






