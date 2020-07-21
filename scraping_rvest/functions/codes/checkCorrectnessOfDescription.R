
checkCorrectnessOfDescription <- function(description)
{
  response <- TRUE
  if(!is.vector(description) || length(description) > 1 || !is.character(description))
  {
    message("Offer description is not a character vector of length 1. The object looks like:\n", description)
    # response <- FALSE
  }
  
  return(response)
  
}