


quantify4OrMorePhotos <- function(moreText)
{
  if(identical(moreText, character(0)))
  {
    noOfPhotos <- 4
  }
  else 
  {
    hiddenPhotosNumber <- gsub(pattern = "[^0-9]", replacement = "", x = moreText)
    noOfPhotos <- as.numeric(hiddenPhotosNumber) + 3
  }
  return(noOfPhotos)
}