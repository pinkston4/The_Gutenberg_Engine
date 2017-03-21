
search_input <- function(inputId, label, value=""){
  tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::tags$script(src = "search_input_bindings.js")
      )
    ),
    shiny::tags$label(label, `for` = inputId),
    shiny::tags$input(id = inputId, type = "text", value = value)
  )
}