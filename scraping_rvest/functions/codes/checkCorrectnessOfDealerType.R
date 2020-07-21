
checkCorrectnessOfDealerType <- function(dealerType)
{
  response <- TRUE
  
  if(!is.vector(dealerType) || length(dealerType) != 1 || !is.character(dealerType))
  {
    message("Offer dealerType is not a character vector of length 1. The object looks like:\n", dealerType)
    # response <- FALSE
  }
  
  return(response)
  
}