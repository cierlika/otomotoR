

getDealerType <- function(page, timeout)
{
  options(timeout = timeout)
  
  dealer <- page %>%
    rvest::html_node(xpath = "//div[@class='offer-content__aside']/div[@class='seller-box']/div[@class='seller-box__seller-info']/small[@class='seller-box__seller-type']") %>%
    rvest::html_text() %>%
    gsub(pattern = "\\s{2,}", replacement = "", x = .)
  
  return(dealer)
}
