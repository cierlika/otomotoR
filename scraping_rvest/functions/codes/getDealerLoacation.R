

getDealerLoacation <- function(page, timeout) 
{
  options(timeout = timeout)
  
  location <- page %>%
    rvest::html_node(xpath = "//div[@class='offer-content__aside']/div[@class='seller-box']/div[@class='seller-box__seller-address']/span[@class='seller-box__seller-address__label']") %>%
    rvest::html_text() %>%
    gsub(pattern = "\\s{2,}", replacement = "", x = .)
  
  return(location)
  
}
