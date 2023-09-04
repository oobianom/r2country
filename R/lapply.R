#' @export
languageOf <- lapply(countries1, function(cnt){
  unlist(data.pck.cntry[data.pck.cntry$name==cnt,]$officiallanguage)
})

#' @export
capitalOf <- lapply(countries1, function(cnt){
  unlist(data.pck.cntry[data.pck.cntry$name==cnt,]$capital)
})

#' @export
populationOf <- lapply(countries1, function(cnt){
  unlist(data.pck.cntry[data.pck.cntry$name==cnt,]$population2023)
})

#' @export
callingCodeOf <- lapply(countries1, function(cnt){
  paste0("+",unlist(data.pck.cntry[data.pck.cntry$name==cnt,]$callingcode))
})

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
#' names(timeOf)[1:10]
#'
#' #task 0: check if the time in Delhi is present
#' grep("Delhi",names(timeOf), value = TRUE)
#'
#' #task 1: check the time in delhi
#' timeOf$delhi
#'
#' #task 2: check the time in Boston
#' timeOf$boston
#'
#' #task 3: view the time in multiple countries
#' timeOf[c("ankara","dubai","ontario")]
#'
#' #task 4: what if the city is not available
#' timeOf[c("randomcity","dili","jerusalem")]
#'
#' @export
timeOf <- lapply(city_time1, function(cnt){
  #message("!!! does not take daylight savings into account yet")
  us.time <- as.POSIXct(Sys.time(), tz = "America/New_York")
  as.POSIXct(as.numeric(unlist(city_time[city_time$City == cnt,]$Timediff)[1]) + us.time)
})

#' Fetch the continent of a country
#'
#' Get the continent that a particular country belongs to
#'
#' @return a list containing all countries and corresponding continents
#' @examples
#' # view the searchable countries
#' names(continentOf)
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

