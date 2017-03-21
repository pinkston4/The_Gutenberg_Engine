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

world <<- new("World")
storage <<- new("Storage", world, "hashes", name="", options="hash-type='bdb'")
model <<- new("Model", world=world, storage, options="")
parser <<- new("Parser", world)

query_gutenberg <- function(userinput){
  queryString <- sprintf('PREFIX dcterms: <http://purl.org/dc/terms/> 
                     SELECT  ?c ?title
                     WHERE {  ?c dcterms:title  ?title 
                        Filter regex(?title, "%s", "i")
                     }', userinput)
  query <- new("Query", world, queryString, base_uri=NULL, query_language="sparql", query_uri=NULL)
  queryResult <- executeQuery(query, model)
  result <<- getNextResult(queryResult)
  
  return(result)
  
}