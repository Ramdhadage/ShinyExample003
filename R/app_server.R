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
  # toReturn <- reactiveValues(
  #   ship_typeid = NULL,
  #   ship_nameid = NULL
  # )
  
   a <- callModule(mod_Dropdown_server,"DropdownUpdation")
  long.dist <- reactive({
    req(a$ship_typeid)
    # print(a$ship_nameid)
    # browser()
    HelperforMap_fun(a$ship_nameid)
      
  })
  # browser()
  callModule(mod_Plot_server,id = "map",long.dist,a)
}
