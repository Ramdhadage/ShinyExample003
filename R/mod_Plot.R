#' Plot UI Function
#'
#' @description A shiny Module.
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

#' Plot Server Function
#'
#' @noRd 
mod_Plot_server <- function(input, output, session,lon.dist,r){
  ns <- session$ns
  output$plot <- renderLeaflet({
    req(r$ship_nameid)
    lon.dist()[[1]] %>%
      leaflet()%>%
      addTiles() %>%
      addMarkers(~LON, ~LAT, label = paste0("Sailed Distance: ",lon.dist()[[2]]," meter"))
  })
}
