#HelperforMap_fun: This function returns longest distance between to consecutive observation 
# and Lat corspondintg to it. 
HelperforMap_fun <-function(ship_nameid){
  
  # ship_filtered.df: this dataframe contains LOn and Lat for selected ship Name  
  
  ship_filtered.df <- ships %>%
    filter(SHIPNAME == ship_nameid) %>% 
    select(LON,LAT)
  
  # dist.df: calculate distance for ship_filtered.df
  
  dist.df <- ship_filtered.df%>%distm()
  
  # Extract difference for consecutive observation.
  
  cons.dist <- rep(NA,nrow(dist.df)-1)
  
  for (i in 1:(nrow(dist.df)-1)) {
    
    cons.dist[i] <- dist.df[i,i+1]
    
  }
  
  # # Longest Distance 
  
  lngst.dist <- max(cons.dist)
  
  #consecutive observations for Longest Distance
  
  lngst.dist.lon.lat <- ship_filtered.df [c(which.max(cons.dist), which.max(cons.dist)+1),]
  
  return(list(lngst.dist.lon.lat, lngst.dist))
}
