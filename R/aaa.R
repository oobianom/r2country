#Fetch relevant country data pack
data(country_calling_code) # calling code for countries
data(country_population) # population by year for countries
data(city_time) # time by city
data(country_names) # country names
data(country_money) # countries currency
data(country_language) # country language
data(country_capital) #country capitals
data(country_continent)# continent countries

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

