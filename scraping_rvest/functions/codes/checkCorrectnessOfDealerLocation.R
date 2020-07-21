
checkCorrectnessOfDealerLocation <- function(dealerLocation)
{
  response <- TRUE
  if(!is.vector(dealerLocation) || length(dealerLocation) != 1 || !is.character(dealerLocation))
  {
    message("Offer dealerLocation is not a character vector of length 1. The object looks like:\n", dealerLocation)
    # respnose <- FALSE
  }
  
  return(response)
  
}
