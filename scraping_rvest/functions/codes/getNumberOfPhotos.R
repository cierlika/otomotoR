
getNumberOfPhotos <- function(page)
{
  
  liWithPhotos <- page %>%
    rvest::html_nodes(xpath = "//div[@class='offer-photos-thumbs']/li")
  numberOfLi <- length(liWithPhotos)
  noOfPhotos <- quantifyPhotos(page = page, noOfAtributes = numberOfLi)
  
  return(noOfPhotos)
}
