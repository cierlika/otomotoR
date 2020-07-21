
getOfferDescription <- function(page, timeout)
{
  options(timeout = timeout)
  
  description <- page %>%
    rvest::html_nodes(xpath = "//div[@id='description']/div") %>%
    rvest::html_text() %>%
    gsub(pattern = "\\n", replacement = " ", x = .) %>%
    gsub(pattern = "\\r", replacement = " ", x = .) %>%
    gsub(pattern = "\\\"", replacement = "'", x = .) %>%
    gsub(pattern = "^\\s{2,}", replacement = " ", x = .) %>%
    gsub(pattern = "\\s{2,}$", replacement = " ", x = .) %>%
    gsub(pattern = "\\s{2,}", replacement = " ", x = .) %>%
    as.data.frame() %>%
    paste(sep = ",")
  
  return(description)
}
