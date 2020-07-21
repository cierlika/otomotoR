

goToPage <- function(URL, timeout)
{
  options(timeout = timeout)
  page <- xml2::read_html(URL, options = c("NOERROR", "NOBLANKS"))
  return(page)
}
