.onLoad <- function(libname, pkgname) {
  # hooks for future enhancements
}


.onAttach <- function(libname, pkgname) {
  # hooks for future enhancements
}

#Fetch relevant country data pack
do.call("data",list(
  "country_calling_code",
  "country_population",
  "city_time",
  "country_names",
  "country_money",
  "country_language",
  "country_capital",
  "country_continent"
))
# data() # calling code for countries
# data() # population by year for countries
# data() # time by city
# data() # country names
# data() # countries currency
# data() # country language
# data() #country capitals
# data()# continent countries

# merge country data
data.pck.cntry <- cbind(
  country_names,
  country_money[-1],
  country_language[-1],
  country_population[-1],
  country_calling_code[-1],
  country_continent[-1],
  country_capital[-1]
)

