#' Dropdown UI Function
#'
#' @description This shiny module creates dropdowns for Ship Type and Ship Name 
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#' @inheritParams    toReturn returns ship name and ship type ids.  
#' @noRd  
#' @import dplyr
#' @importFrom shiny NS tagList 
mod_Dropdown_ui <- function(id){
  
  tagList(
    
    selectInput(NS(id,"ship_type_dropdown"), "Select Ship Type: ",
                unique(ships$ship_type)),
    
    selectInput(NS(id,"ship_name_dropdown"), "Select Ship Name: ",NULL)
    
  )
}

#' Dropdown Server Function
#'@description This module update Ship name dropdown.this module return ids of ship type and ship name.
#'    
#' @param input,output,session Internal parameters for {shiny}.
#' @params    toReturn is reactive list contains Ship Name and Ship Type column name selected by user.
#' @noRd 
mod_Dropdown_server <- function(input, output, session){
  
  ns <- session$ns
  
  toReturn <- reactiveValues(
    ship_typeid = NULL,
    ship_nameid = NULL
  )
  
  observe({
    
    # Choices for 'Select Ship Name' dropdown 
    # browser()
    choices <-  ships %>% filter(ship_type == input$ship_type_dropdown) %>%
      select(SHIPNAME) %>% unique()
    
    updateSelectInput(session, "ship_name_dropdown",
                      "Select Ship Name: ",
                      choices =choices
    )  
    
    toReturn$ship_typeid <- input$ship_type_dropdown
    
    toReturn$ship_nameid <- input$ship_name_dropdown
  })
  
  return(toReturn)
}

