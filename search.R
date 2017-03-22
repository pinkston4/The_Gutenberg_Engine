
search_input <- function(inputId, label, value=""){
  tagList(
    shiny::tags$label(label, `for` = inputId),
    shiny::tags$input(id = inputId, type = "text", value = value)
  )
}