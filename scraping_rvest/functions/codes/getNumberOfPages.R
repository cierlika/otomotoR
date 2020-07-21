

getNumberOfPages <- function(URL)
{
  options(stringsAsFactors = FALSE)
  loadPackages(pckgs = c("rvest", "xml2"))
  
  homePage <- xml2::read_html(URL)
  
  pageNumbersElements <- homePage %>%
    rvest::html_nodes(xpath = "//section[@id='body-container']/div[@class='container-fluid container-fluid-sm']/div[@class='row']/ul[@class='om-pager rel']/li") 
  
  lastPageNumberElement <- pageNumbersElements[length(pageNumbersElements)-1] ## -1 ponieważ ostatnim elementem jest strzałka, za pomocą której przechodzi się do następnej strony
  
  lastPageNumber <- rvest::html_text(lastPageNumberElement) %>%
    gsub(pattern = "\\s{2,}", replacement = "", x = .) %>%
    as.numeric()
  
  return(lastPageNumber)
  
}

