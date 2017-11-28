## Load packages
#Load the packages necessary to execute the CSF code

# Install required packages
Load_Packages_CSF <- function()
{
  if(!require(stringr)) 
    {
      message("installing the 'stringr' package")
      install.packages("stringr")
      library(stringr)
    }
  if(!require(dplyr)) 
    {
      message("installing the 'dplyr' package")
      install.packages("dplyr")
      library(dplyr)
    }
  
  if(!require(tidyr)) 
    {
      message("installing the 'tidyr' package")
      install.packages("tidyr")
      library(tidyr)
    }
  
  if(!require(magrittr)) 
    {
      message("installing the 'magrittr' package")
      install.packages("magrittr")
      library(magrittr)
    }
  if(!require(zoo)) 
  {
    message("installing the 'zoo' package")
    install.packages("zoo")
    library(zoo)
  }
  if(!require(ggplot2)) 
  {
    message("installing the 'ggplot2' package")
    install.packages("ggplot2")
    library(ggplot2)
  }
  if(!require(leaflet))
  {
    message("installing the 'leaflet")
    install.packages("leaflet")
    library(leaflet)
  }
  if(!require(formattable))
  {
    message("installing the 'formattable")
    install.packages("formattable")
    library(formattable)
  }
  if(!require(data.table))
  {
    message("installing the 'data.table")
    install.packages("data.table")
    library(data.table)
  }
  if(!require(xlsx))
  {
    message("installing the 'xlsx")
    install.packages("xlsx")
    library(xlsx)
  }
  if(!require(scales))
  {
    message("installing the 'scales")
    install.packages("scales")
    library(scales)
  }
}

  
  