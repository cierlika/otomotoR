

getOfferEquipmentLabels <- function(page, timeout)
{
  options(timeout = timeout)
  
  equipment <- page %>%
    rvest::html_nodes(xpath = "//div[@class='offer-features__row']/ul[@class='offer-features__list']/li[@class='offer-features__item']") %>%
    rvest::html_text() %>%
    gsub(pattern = "\\s{2,}", replacement = "", x = .)
  
  return(equipment)
}
