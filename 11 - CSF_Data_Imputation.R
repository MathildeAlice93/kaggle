# Data imputaton for Oil_DS

## replace the missing value for the oil dataset by the average between the previous row and the next row
oil_DS$dcoilwtico[1] <- oil_DS$dcoilwtico[2]
oil_DS <- data_frame(oil_DS$date , na.approx(oil_DS$dcoilwtico))
      
names(oil_DS)[1]<-paste("date")
names(oil_DS)[2]<-paste("price")
