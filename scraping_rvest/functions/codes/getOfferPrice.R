
getOfferPrice <- function(page, timeout)
{
  options(timeout = timeout)
  
  offerPriceNumber <- page %>%
    rvest::html_node(xpath = '//*[@id="siteWrap"]/main/div[2]/div[2]/div[1]/div[1]/div[2]/div/div[1]/span[1]') %>%
    rvest::html_text() %>%
    gsub(pattern = "[^0-9.]", replacement = "", x = .)%>%
    as.numeric()
  
  offerPriceCurrency <- page %>%
    rvest::html_node(xpath = '//*[@id="siteWrap"]/main/div[2]/div[2]/div[1]/div[1]/div[2]/div/div[1]/span[1]/span') %>%
    rvest::html_text()
  
  offerPriceDetails <- page %>%
    rvest::html_node(xpath = '//*[@id="siteWrap"]/main/div[2]/div[2]/div[1]/div[1]/div[2]/div/div[1]/span[2]') %>%
    rvest::html_text() %>%
    strsplit(split = ", ") %>%
    unlist() %>%
    unname()
  
  if(length(offerPriceDetails)==0){
    offerPriceDetails<-"brak"
  }else{
    offerPriceDetails<-offerPriceDetails
  }
  
  offerPriceAll <- c(Cena = offerPriceNumber, Waluta = offerPriceCurrency, CenaDodInfo = offerPriceDetails)
  
  
  return(offerPriceAll)
  
}
