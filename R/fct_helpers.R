#This function returns lon and lat of longest distance and longest distance
HelperforMap_fun <-function(ship_nameid){
  
  ship_filtered.df <- ships %>%
    filter(SHIPNAME == ship_nameid) %>% 
    select(LON,LAT)
  # dist.df: calculate distance for selected ship_type and ShipName using lon and lat
  dist.df <- ship_filtered.df%>%distm()
  #     # Extract difference for consecutive observation.
  cons.dist <- rep(NA,nrow(dist.df)-1)
  for (i in 1:(nrow(dist.df)-1)) {
    cons.dist[i] <- dist.df[i,i+1]
  }
  # # Longest Distance Index
  lngst.dist <- max(cons.dist)
  # # ship data consecutive observation
  lngst.dist.lon.lat <- ship_filtered.df [c(which.max(cons.dist), which.max(cons.dist)+1),]
  return(list(lngst.dist.lon.lat, lngst.dist))
}
