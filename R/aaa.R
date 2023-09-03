#Fetch relevant country data pack
data(country_calling_code) # calling code for countries
data(country_population) # population by year for countries
data(city_time) # time by city
data(country_names) # country names
data(country_money) # countries currency
data(country_language) # country language
# continent countries

# merge country data
data.pk.cntry <- cbind(
  country_names,
  country_money[-1],
  country_language[-1],
  country_population[-1],
  country_calling_code[-1]
)

