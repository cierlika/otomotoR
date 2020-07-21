
checkCorrectnessOfPhotos <- function(photos)
{
  response <- TRUE
  if(!is.numeric(photos))
  {
    message(paste0("Number of photos is not numeric and looks like: ", photos))
  }
  return(response)
}
