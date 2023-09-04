.onLoad <- function(libname, pkgname) {
  # hooks for future enhancements
}


.onAttach <- function(libname, pkgname) {
  # hooks for future enhancements
}

#Fetch relevant country data pack
do.call("data",list(
  "country_calling_code",# calling code for countries
  "country_population",# population by year for countries
  "city_time",# time by city
  "country_names",# country names
  "country_money",# countries currency
  "country_language",# country language
  "country_capital",#country capitals
  "country_continent"# continent countries
))


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

