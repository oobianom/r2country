
#' Fetch the official language of a country
#'
#' With specified country name or names, get the associated official language(s)
#'
#' @return a list containing all countries and their corresponding language
#' @examples
#' # view the searchable countries, return first 6
#' head(names(languageOf))
#'
#' #task 0: check if the language of japan is included
#' #should be all in lower case
#' grep("japan",names(languageOf), value = TRUE)
#'
#' #task 1: check the language of nigeria
#' languageOf$nigeria
#'
#' #task 2: check the language of united states
#' languageOf$`united states`
#'
#'
#' #task 3: check language of multiple countries
#' languageOf[c("slovenia","romania","malaysia")]
#'
#' #task 4: what if the language is not available
#' languageOf[c("randomcountry","mexico","luxembourg")]
#'
#' @export
languageOf <- lapply(countries1, function(cnt){
  unlist(data.pck.cntry[data.pck.cntry$name==cnt,]$officiallanguage)
})

#' Fetch the latest capital of a country
#'
#' With specified country name or names, get the associated capital
#'
#' @return a list containing all countries and their corresponding capital
#' @examples
#' # view the searchable countries, return first 6
#' head(names(capitalOf))
#'
#' #task 0: check if the capital of japan is included
#' #should be all in lower case
#' grep("japan",names(capitalOf), value = TRUE)
#'
#' #task 1: check the capital of nigeria
#' capitalOf$nigeria
#'
#' #task 2: check the capital of united states
#' capitalOf$`united states`
#'
#'
#' #task 3: check capital of multiple countries
#' capitalOf[c("slovenia","romania","malaysia")]
#'
#' #task 4: what if the capital is not available
#' capitalOf[c("randomcountry","mexico","luxembourg")]
#'
#' @export
capitalOf <- lapply(countries1, function(cnt){
  unlist(data.pck.cntry[data.pck.cntry$name==cnt,]$capital)
})


#' Fetch the latest population of a country
#'
#' With specified country name or names, get the associated population
#'
#' @return a list containing all countries and their corresponding population
#' @examples
#' # view the searchable countries, return first 6
#' head(names(populationOf))
#'
#' #task 0: check if the population of japan is included
#' #should be all in lower case
#' grep("japan",names(populationOf), value = TRUE)
#'
#' #task 1: check the population of nigeria
#' populationOf$nigeria
#'
#' #task 2: check the population of united states
#' populationOf$`united states`
#'
#'
#' #task 3: check population of multiple countries
#' populationOf[c("slovenia","romania","malaysia")]
#'
#' #task 4: what if the population is not available
#' populationOf[c("randomcountry","mexico","luxembourg")]
#'
#' @export
populationOf <- lapply(countries1, function(cnt){
  unlist(data.pck.cntry[data.pck.cntry$name==cnt,]$population2023)
})

#' Fetch the calling code of a country
#'
#' With specified country name or names, get the associated calling code
#'
#' @return a list containing all countries and their corresponding calling code
#' @examples
#' # view the searchable countries, return first 6
#' head(names(callingCodeOf))
#'
#' #task 0: check if the calling code of japan is included
#' #should be all in lower case
#' grep("japan",names(callingCodeOf), value = TRUE)
#'
#' #task 1: check the calling code of nigeria
#' callingCodeOf$nigeria
#'
#' #task 2: check the calling code of united states
#' callingCodeOf$`united states`
#'
#'
#' #task 3: check calling code of multiple countries
#' callingCodeOf[c("slovenia","romania","malaysia")]
#'
#' #task 4: what if the calling code is not available
#' callingCodeOf[c("randomcountry","mexico","luxembourg")]
#'
#' @export
callingCodeOf <- lapply(countries1, function(cnt){
  paste0("+",unlist(data.pck.cntry[data.pck.cntry$name==cnt,]$callingcode))
})


#' Fetch the currency of a country
#'
#' With specified country name or names, get the associated currency
#'
#' @return a list containing all countries and their corresponding currency
#' @examples
#' # view the searchable countries, return first 6
#' head(names(currencyOf))
#'
#' #task 0: check if the currency of spain is included
#' #should be all in lower case
#' grep("spain",names(currencyOf), value = TRUE)
#'
#' #task 1: check the currency of spain
#' currencyOf$spain
#'
#' #task 2: check the currency of singapore list
#' currencyOf$singapore # return a list of singapore
#' currencyOf$singapore['symbol'] #returns the symbol
#' currencyOf$singapore['isocode'] #returns the iso code
#' currencyOf$singapore['fractionalunity'] #returns the fractional unit
#'
#'
#' #task 3: check currencies of multiple countries
#' currencyOf[c("slovenia","romania","malaysia")]
#'
#' #task 4: what if the currency is not available
#' currencyOf[c("randomcountry","mexico","luxembourg")]
#'
#' @export

currencyOf <- lapply(countries1, function(cnt){
  dcntry <- data.pck.cntry[data.pck.cntry$name==cnt,c("currency","symbol","isocode","fractionalunity")]
  if(nrow(dcntry)) unlist(dcntry) else NULL
})


city_time1 <- unlist(unique(city_time$City))
names(city_time1) <- tolower(city_time1)


#' Fetch the current time in a specific city
#'
#' Get the current time using specified city name
#'
#' @return a list containing all cities and corresponding local time
#' @examples
#' # view the searchable cities, return first 10
#' names(timeIn)[1:10]
#'
#' #task 0: check if the time in Delhi is present
#' #should be all in lower case
#' grep("delhi",names(timeIn), value = TRUE)
#'
#' #task 1: check the time in delhi
#' timeIn$delhi
#'
#' #task 2: check the time in Boston
#' timeIn$boston
#'
#' #task 3: view the time in multiple countries
#' timeIn[c("ankara","dubai","ontario")]
#'
#' #task 4: what if the city is not available
#' timeIn[c("randomcity","york","jerusalem")]
#'
#' @export
timeIn <- lapply(city_time1, function(cnt){
  #message("!!! does not take daylight savings into account yet")

  # Year	Daylight Saving Time Begins	Daylight Saving Time Ends
  # 2023	Sunday, March 12 at 2:00 A.M.	Sunday, November 5 at 2:00 A.M.
  # 2024	Sunday, March 10 at 2:00 A.M.	Sunday, November 3 at 2:00 A.M.
  # 2025	Sunday, March 9 at 2:00 A.M.	Sunday, November 2 at 2:00 A.M.
  # 2026	Sunday, March 8 at 2:00 A.M.	Sunday, November 1 at 2:00 A.M.

  us.time <- as.POSIXct(Sys.time(), tz = "America/New_York")
  as.POSIXct(as.numeric(unlist(city_time[city_time$City == cnt,]$Timediff)[1]) + us.time)
})

#' Fetch the continent of a country
#'
#' Get the continent that a particular country belongs to
#'
#' @return a list containing all countries and corresponding continents
#' @examples
#' # view the searchable countries, return first 15
#' names(continentOf)[1:15]
#'
#' #task 1: view the continent of algeria
#' continentOf$algeria
#'
#' #task 2: view the continent of nigeria
#' continentOf$nigeria
#'
#' #task 3: view the continent of multiple countries
#' continentOf[c("niger","china","colombia")]
#'
#' #task 4: if the continent is not available
#' continentOf[c("niger","china","randomtest")]
#'
#' @export
continentOf <- lapply(countries1, function(cnt){
  unlist(data.pck.cntry[data.pck.cntry$name==cnt,]$continent)
})

