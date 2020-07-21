


getPageNumbersList <- function(page, timeout)
{
  options(timeout = timeout)
  pageNumbersList <- page %>%
    rvest::html_nodes(xpath = "//section[@id='body-container']/div[@class='container-fluid container-fluid-sm']/div[@class='row']/ul[@class='om-pager rel']/li/a/span") %>%
    rvest::html_text() 
  
  return(pageNumbersList)
  
}
