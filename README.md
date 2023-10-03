# r2country: Compiled dataset and functions for country names, capitals, languages and so on. 

### Official website: https://r2country.obi.obianom.com <img src="https://r2country.obi.obianom.com/hex-r2country.png" align="right" width="150">

#### Quick calls to obtain various country info for use in writing R markdown and developing robust applications


***

## Install

```
remotes::install_github("oobianom/r2country")

#or from CRAN

install.packages("r2country") 

```

***

## Use

### Get all countries

```
#load package
library(r2country)

#get countries
countries

#or
#get countries in uppercase
COUNTRIES
```

### Load datasets

```
data(country_calling_code) # calling code for countries
data(country_population) # population by year for countries
data(city_time) # time by city
data(country_names) # country names
data(country_money) # countries currency
data(country_language) # country language
data(country_capital) #country capitals
data(country_continent)# continent countries

```

### Use functions available

#### Few examples

``` 
#get capital of a country

capitalOf$nigeria #for nigeria
capitalOf$china #for china
capitalOf[c("slovenia","romania","malaysia")] #get multiple capitals

#get offical languages of a country

languageOf$romania #for romania
languageOf$mexico #for mexico
languageOf[c("egypt","united kingdom","taiwan")] #get multiple languages

#get population count of country

populationOf$india #for india
populationOf$brazil #for brazil
populationOf[c("slovenia","ghana","nigeria")] #get multiple countries


#get the current time in a place

grep("usa,",names(timeIn), value = T) #get the available USA regions
timeIn$`usa, california, oakland` #get the current time in Oakland, California

grep("nigeria,",names(timeIn), value = T) #get the available Nigeria regions
timeIn$`nigeria, lagos, lagos` #get the current time in Lagos, Nigeria

# And others...

```

### Get more examples

For complete list, go to official website above





