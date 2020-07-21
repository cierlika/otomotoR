
library(tidyr)
library(gdata)

load("data/offers.RData")

offers$Label <- gsub(pattern = " ", replacement = "\\.", x = offers$Label)

offers_list <- split(offers, offers$Id)

offersUnique_list <- lapply(offers_list, function(df) {
  df <- df[!duplicated(df) , ]
  n_offerDate <- sum(df$Label=="Data.oferty")
  if(n_offerDate > 1)
  {
    df[df$Label=="Data.oferty" , "Value" ] <- max(df[df$Label=="Data.oferty" ,"Value" ])
    df <- df[!duplicated(df) , ]
  }
  s <- sum(duplicated(df$Label))
  if(s>0)
  {
    df[gdata::duplicated2(df$Label) , "Value"] <- min(df[gdata::duplicated2(df$Label) , "Value"])
    df <- df[!duplicated(df) , ]
  }
  return(df)
})

offers_short <- do.call("rbind", offersUnique_list)
rownames(offers_short) <- 1:nrow(offers_short)

nrow(offers_short)
length(unique(offers_short$Id))
sum(table(offers_short[offers_short$Label=="Marka.pojazdu" , "Value"]))

offers_long <- spread(data = offers_short, key = Label, value = Value)

save(offers_long, offers_short, file = "./data/offerTables.RData")


setwd("C:/Users/cierl/Downloads/OTOMOTO-master (1)/OTOMOTO-master/scraping_rvest/data")
load("offerTables.RData")
offers_long$Opis[1]


write.csv(offers_long, "offers_cleaned.csv", fileEncoding = "ASCII//TRANSLIT")
unique(offers_long$ABS)

names(offers_long)

for(i in 1:128){
  print(c(length(unique(offers_long[,i])),names(offers_long)[i]))
}

unique(offers_long$Pojemnoœæ.skokowa)
table(offers_long$CenaDodInfo3)

# offers_long$Emisja.CO2<-gsub('\\"',' ', offers_long$Emisja.CO2)
# offers_long$Kod.Silnika<-gsub('\\"',' ', offers_long$Kod.Silnika)
# offers_long$Lokalizacja<-gsub('\\"',' ', offers_long$Lokalizacja)
# offers_long$Model.pojazdu<-gsub('\\"',' ', offers_long$Model.pojazdu)
# offers_long$Numer.rejestracyjny.pojazdu<-gsub('\\"',' ', offers_long$Numer.rejestracyjny.pojazdu)
# offers_long$Opis<-gsub('\\"',' ', offers_long$Opis)
# offers_long$VIN<-gsub('\\"',' ', offers_long$VIN)
# offers_long$Wersja<-gsub('\\"',' ', offers_long$Wersja)
# 
# which(is.na(as.numeric(offers_long$Cena)))
offers_long<-offers_long[-which(is.na(as.numeric(offers_long$Cena))),]
# which(as.numeric(offers_long$Cena)>1000000)
offers_long<-offers_long[-which(as.numeric(offers_long$Cena)>1000000),]
# hist(as.numeric(offers_long$Cena),breaks = 100)
offers_long<-offers_long[-which(offers_long$Waluta=="EUR"),]
# 
# offers_long$Opis<-gsub("\\'"," ", offers_long$Opis)
# offers_long$Opis<-gsub("\\„"," ", offers_long$Opis)
# offers_long$Opis<-gsub("\\”"," ", offers_long$Opis)
# offers_long$Opis<-gsub("[[:punct:][:blank:]]+", " ", offers_long$Opis)
# offers_long$Opis<-gsub("\\“", " ", offers_long$Opis)
# offers_long$Opis<-gsub("\\’", " ", offers_long$Opis)
# offers_long$Opis<-gsub("17”", " ", offers_long$Opis)
# offers_long$Opis<-gsub('”', ' ', offers_long$Opis)
# # offers_long<-offers_long[-7957,]
# # offers_long<-offers_long[-10157,]
# # offers_long<-offers_long[-10168,]
# Opis<-as.data.frame(offers_long$Opis)

offers_long$Opis<-gsub('[[:punct:]]', ' ', offers_long$Opis)
offers_long$Opis<-gsub('[^A-Za-z0-9¹æê³ñóœŸ¿¥ÆÊ£ÑÓŒ¯]', ' ', offers_long$Opis)



offers_cleaned <- read.csv("C:/Users/cierl/Downloads/OTOMOTO-master (1)/OTOMOTO-master/scraping_rvest/data/offers_cleaned.csv",sep=",")
which(offers_cleaned$ABS!=1)
offers_long$Opis[11605]
offers_long[which(offers_long$Id=="6056763835"),]

gsub('[[:punct:]]', ' ', offers_long$Opis[7957])

gsub("[^A-Za-z0-9¹æê³ñóœŸ¿¥ÆÊ£ÑÓŒ¯]"," ",offers_long$Opis[7954])
