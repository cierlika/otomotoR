
## offer.type = c("a", "n", "u") 
### "a" - all (https://www.otomoto.pl/osobowe/) ;
### "n" - new (https://www.otomoto.pl/osobowe/uzywane/) ;
### "u" - used (https://www.otomoto.pl/osobowe/nowe/)

defineURLcore <- function(offerType)
{
  
  if(offerType=="a")
  {
    url <- "https://www.otomoto.pl/osobowe/"
  }
  else if(offerType=="n")
  {
    url <- "https://www.otomoto.pl/osobowe/uzywane/"
  }
  else if(offerType=="u")
  {
    url <- "https://www.otomoto.pl/osobowe/nowe/"
  }
  else
  {
    stop("Incorect value of offer type argument. Should be one of c('a', 'n', 'u') ")
  }
  return(url)
}