
checkingIfLastIteration <- function(currentIter = i, maxIteration = n_iter)
{
  if(currentIter == maxIteration)
  {
    assign(x = "metaData", 
           value = list(pageNumber = get(x = "metaData", envir = globalenv())$pageNumber, 
                        ifFirstRun = get(x = "metaData", envir = globalenv())$ifFirstRun,
                        ifStopFunction = TRUE), 
           envir = globalenv())
  }
  return(invisible())
}