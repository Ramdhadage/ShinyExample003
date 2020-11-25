#' mod_Plot UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_mod_Plot_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' mod_Plot Server Function
#'
#' @noRd 
mod_mod_Plot_server <- function(input, output, session){
  ns <- session$ns
 
}
    
## To be copied in the UI
# mod_mod_Plot_ui("mod_Plot_ui_1")
    
## To be copied in the server
# callModule(mod_mod_Plot_server, "mod_Plot_ui_1")
 
