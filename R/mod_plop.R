#' plop UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @import dplyr
mod_plop_ui <- function(id){
  # ns <- NS(id)
  tagList(
    selectInput(NS(id,"ship_type_dropdown"), "Select Ship Type: ",
                unique(ship$ship_type)),
    selectInput(NS(id,"ship_name_dropdown"), "Select Ship Name: ",NULL)
  )
}
    
#' plop Server Function
#'
#' @noRd 
mod_plop_server <- function(input, output, session){
  ns <- session$ns
  observe({
    # browser()
    updateSelectInput(session, "ship_name_dropdown",
                      "Select Ship Name: ",
                      choices = ships%>% filter(ship_type==input$ship_type_dropdown)%>%select(SHIPNAME)%>% unique()
    )
  })
}
    
## To be copied in the UI
# mod_plop_ui("plop_ui_1")
    
## To be copied in the server
# callModule(mod_plop_server, "plop_ui_1")
 
