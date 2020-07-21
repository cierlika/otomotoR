
checkingIfTerminateFunction <- function(currentPageNr, lastPageNr)
{
  
  if(currentPageNr == lastPageNr )
  {
    assign(x = "metaData", 
           value = list(pageNumber = get(x = "metaData", envir = globalenv())$pageNumber, 
                        ifFirstRun = get(x = "metaData", envir = globalenv())$ifFirstRun,
                        ifStopFunction = TRUE), 
           envir = globalenv())
  }
  return(invisible())
}