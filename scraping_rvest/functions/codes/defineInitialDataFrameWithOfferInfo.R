

defineInitialDataFrameWithOfferInfo <- function(initDF)
{
  
  if( is.null(initDF))
  {
    initDF <- data.frame(
      Id = character(0),
      Label = character(0),
      Value = character(0)
    )
    message("Run function without initial data frame.")
  }
  else if( !exists( x = initDF, envir = globalenv() ) )
  {
    stop("The declared init data frame is not avaiable in global environment.")
  }
  else
  {
    initDF <- get(x = initDF, envir = globalenv() )
    message("Run function with initial data frame.")
  }
  
  return(initDF)
  
}
