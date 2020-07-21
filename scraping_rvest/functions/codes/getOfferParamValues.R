
getOfferParamValues <- function(paramElement, timeout)
{
  options(timeout = timeout)
  
  values <- paramElement %>%
    rvest::html_nodes(xpath = "//ul/li/div[@class='offer-params__value']") %>%
    rvest::html_text() %>%
    gsub(pattern = "\\s{2,}", replacement = "", x = .)
  
  return(values)
}
