#' Dropdown UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#
#' @importFrom shiny NS tagList 
mod_Dropdown_ui <- function(id){
  # ns <- NS(id)
  tagList(
    selectInput(NS(id,"ship_type_dropdown"), "Select Ship Type: ",
                unique(ships$ship_type)),
    selectInput(NS(id,"ship_name_dropdown"), "Select Ship Name: ",NULL)
    
  )
}

#' Dropdown Server Function
#'
#' @noRd 
mod_Dropdown_server <- function(input, output, session){
  ns <- session$ns
  toReturn <- reactiveValues(
    ship_typeid = NULL,
    ship_nameid = NULL
  )
  observe({
    if(input$ship_name_dropdown== ""){
      updateSelectInput(session, "ship_name_dropdown",
                        "Select Ship Name: ",
                        choices = ships %>% 
                          filter(ship_type == input$ship_type_dropdown) %>%
                          select(SHIPNAME) %>% unique()
      )  
    }
    else{
      updateSelectInput(session, "ship_name_dropdown",
                        "Select Ship Name: ",
                        choices = ships %>% 
                          filter(ship_type == input$ship_type_dropdown) %>%
                          select(SHIPNAME) %>% unique(),selected = input$ship_name_dropdown
      )
    }
    toReturn$ship_typeid <- input$ship_type_dropdown
    toReturn$ship_nameid <- input$ship_name_dropdown
  })
  return(toReturn)
}

## To be copied in the UI
# mod_Dropdown_ui("Dropdown_ui_1")

## To be copied in the server
# callModule(mod_Dropdown_server, "Dropdown_ui_1")

