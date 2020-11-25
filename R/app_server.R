#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import geosphere
#' @import leaflet
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here
  
  # Calling the mod_dropdown model and return it to Dropdown list
  
   Dropdown <- callModule(mod_Dropdown_server, "DropdownUpdation")
  
   # stored longest distance and corsponding consecutive LON and Lat in reactive list.
  
    long.dist <- reactive({
    
     req(Dropdown$ship_typeid)
    
    HelperforMap_fun(Dropdown$ship_nameid)
      
  })
  
  #This module plot the consecutive LON and lat on maps using leaflet and add note of sailed distance    
  
    callModule(mod_Plot_server, id = "map", long.dist, Dropdown)
}
