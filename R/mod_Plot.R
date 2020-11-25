#' Plot UI Function
#'
#' @description A shiny create UI for maps using consecutive LON and Lat of Longest distance .
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @import leaflet
mod_Plot_ui <- function(id){
  
  ns <- NS(id)
  
  tagList(
    
    leafletOutput(NS(id,"plot"), width = "100%", height = "100%")
  )
}
#' @description A shiny create server for maps using consecutive LON and Lat of Longest distance and plot it as well as give short 
#' note containg distance sailed.
#'@param lon.dist is list contain longest dist and corrsponding consecutive LON and Lat.
#'@param  toReturn is reactive list contains Ship Name and Ship Type column name selected by user.
#' @noRd 
mod_Plot_server <- function(input, output, session,lon.dist,toReurn){
  
  ns <- session$ns
  
  output$plot <- renderLeaflet({
    
    req(toReurn$ship_nameid)
    
    lon.dist()[[1]] %>%
      leaflet()%>%
      addTiles() %>%
      addMarkers(~LON, ~LAT, label = paste0("Sailed Distance: ",lon.dist()[[2]]," meter"))
  })
}
