

quantifyPhotos <- function(page, noOfAtributes)
{
  
  if(noOfAtributes < 4)
  {
    noOfPhotos <- noOfAtributes
  }
  else
  {
    hiddenPhotosText <- page %>%
      rvest::html_nodes(xpath = "//div[@class='offer-photos-thumbs']/a[@class='offer-photos-thumbs__link-more']") %>%
      rvest::html_text()
    noOfPhotos <- quantify4OrMorePhotos(moreText = hiddenPhotosText)
  }
  return(noOfPhotos)
}
