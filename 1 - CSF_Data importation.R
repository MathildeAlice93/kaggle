## Part 1: Importation of the datasets

# paths
dir_fran <- 'C:/Users/fwilberz/Documents/Kaggle/Corporacion'
# dir_math <- 
# dir_guillaume
# dir_...

# path global
dir <- dir_fran


# 1. Holidays_events
holidays_events_DS <- fread(paste0(dir, '/holidays_events.csv'))

# 2.items 
items_DS <- fread(paste0(dir, '/items.csv'))

# 3.oil 
oil_DS <- fread(paste0(dir, '/oil.csv'))
oil_DS$date <- as.Date(oil_DS$date, "%Y-%m-%d")

# 4. sample_submission
sample_DS <- fread(paste0(dir, '/sample_submission.csv'))

# 5. stores
stores_DS <- fread(paste0(dir, '/stores.csv'))

# 6. test
test_DS <- fread(paste0(dir, '/test.csv'))


# 7. train 
# it would be better to use fread and to work with data.table as it will be way faster for manipulation
train_DS <- fread(paste0(dir, '/train.csv'))

# 8. transactions
transactions_DS <- fread(paste0(dir, '/transactions.csv'))

rm(test_DS)



