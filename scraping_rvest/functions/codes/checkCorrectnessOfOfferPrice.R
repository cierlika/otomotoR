
checkCorrectnessOfOfferPrice <- function(offerPrice)
{
  
  response <- TRUE
  
  if(!is.vector(offerPrice) || length(offerPrice) < 3 || !is.character(offerPrice))
  {
    message("Offer price object is not a character vector of minimum length 3. The object looks like:\n", offerPrice)
    response <- FALSE
  }
  
  numericPrice <- as.numeric(offerPrice[1])
  if(is.na(numericPrice))
  {
    message("Offer price is non-numeric type. The price looks like:\n", offerPrice[1])
    response <- FALSE
  }
  
  return(response)
  
}
