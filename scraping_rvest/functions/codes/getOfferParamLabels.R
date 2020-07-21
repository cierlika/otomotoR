

getOfferParamLabels <- function(paramElement, timeout)
{
  options(timeout = timeout)
  
  labels <- paramElement %>%
    rvest::html_nodes(xpath = "//ul/li/span[@class='offer-params__label']") %>%
    rvest::html_text() %>%
    gsub(pattern = " ", replacement = ".", x = .)
  
  return(labels)
}

