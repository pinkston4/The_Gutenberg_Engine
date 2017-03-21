library(commonmark)
library(desc)
library(datasets)
library(graphics)
library(grDevices)
library(methods)
library(stats)
library(utils)
library(roxygen2)
library(redland)
library(shiny)

#setting working directory
setwd("/home/jackpinkston/the_gutenberg_engine")

#initializing classes for database interaction
world <<- new("World")
storage <<- new("Storage", world, "hashes", name="", options="hash-type='bdb'")
model <<- new("Model", world=world, storage, options="")
parser <<- new("Parser", world)

#shiny server function 
shinyServer(
  function(input, output){
    
    observe({
      
      queryString <- sprintf('PREFIX dcterms: <http://purl.org/dc/terms/> 
                       SELECT  ?c ?title
                       WHERE {  ?c dcterms:title  ?title 
                          Filter regex(?title, "%s", "i")
                       }', input$user_search)
      query <- new("Query", world, queryString, base_uri=NULL, query_language="sparql", query_uri=NULL)
      queryResult <- executeQuery(query, model)
      result <- getNextResult(queryResult)
      
      output$search_result <- renderText({
        as.character(result)
      })
      
    })
  
  
})