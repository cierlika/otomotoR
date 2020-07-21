offers_cleaned_good<-offers_cleaned_good[,-1]

summary(offers_cleaned_good)

#kolumny ze zmiennymi kategorialnymi do zmiany na 0-1
cat_col_to_change<-c("Akryl..niemetalizowany.","Bezwypadkowy","Faktura.VAT", "Filtr.czastek.stalych",
                     "Homologacja.ciezarowa", "Kierownica.po.prawej..Anglik.", "Leasing", "Matowy", "Metalik",
                     "Mozliwosc.finansowania", "Perlowy", "Pierwszy.wlasciciel", "Serwisowany.w.ASO", "Tuning",
                     "Uszkodzony", "VAT.marza", "Zarejestrowany.jako.zabytek", "Zarejestrowany.w.Polsce")


to_numeric<-c("Liczba.pozostalych.rat", "Miesieczna.rata", "Moc", "Oplata.poczatkowa", "Pojemnosc.skokowa", "Przebieg")

# Pierwsza.rejestracja - przekształcić do różnicy dni


# zmiana "Tak" na 1
offers_cleaned_good[cat_col_to_change][is.na(offers_cleaned_good[cat_col_to_change])==FALSE]<-1

# zmiana na typ integer
offers_cleaned_good[cat_col_to_change] <- sapply(offers_cleaned_good[cat_col_to_change],as.integer)
sapply(offers_cleaned_good[cat_col_to_change], class)

# kolumny typu integer
integer_columns <- names(which(sapply(offers_cleaned_good, class)=="integer"))

#####################################################################################

summary(offers_cleaned_good$Cena)

X<-offers_cleaned_good[, c(integer_columns)]

X[is.na(X)]<-0
X$Cena<-log(X$Cena)

X$Rok.produkcji_2<-X$Rok.produkcji^2
X$Rok.produkcji_3<-X$Rok.produkcji^3

fit <- lm(Cena ~., data = X)
summary(fit)
plot(fit)

which.min(fit$fitted.values - X$Cena)

