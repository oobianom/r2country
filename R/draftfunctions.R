countries1 <- countries
names(countries1)= tolower(countries1)

#' Get country states
#'
#' Fetch all country states
#'
#' @rdname countryitems
#' @format NULL
#' @docType NULL
#' @keywords NULL
#' @export
getCTRY<-lapply(countries1,function(i){
  rlang::new_function(
    args = rlang::exprs(item = c("currency","language","callingcode","population"), as.of = 2023),
    rlang::expr({
      ctry.name = !!i
      item = match.arg(item)
      print(item)
      print("heelo")
    }),
    env = asNamespace("quickcode")
  )
})


# xxy<-lapply(countries1,function(i){
#   p = i
#   paste0("popeplr",p)
# })


#' Fetch countries that start with specified characters
#'
#' Subset and return countries given a specified characters to search
#'
#' @param char character to search for
#' @param full.list whether to return only name of country or full list
#'
#' @return country data list matching a specified character
#'
#' @seealso [countryEndsWith()] for country search ending in specified character, and [countryHas()] for countries that contain specified characters.
#'
#' @keywords NULL
#'
#' @examples
#' # task 1: get only names of countries that start with "A" or "a"
#' # note that the search in case-insensitive
#' countryStartsWith("A", full.list = F)
#'
#' # task 2: get only names of countries that start with "No" or "no"
#' countryStartsWith("no", full.list = F)
#'
#' # task 3: repeat task 2, but return full list for each country
#' countryStartsWith("no")
#'
#' @export
countryStartsWith <- function(char, full.list = TRUE){
  # filter data
  dcntry <- data.pck.cntry[startsWith(tolower(data.pck.cntry$name),tolower(char)),]
  if(nrow(dcntry)){
    # return results if > 0
    if(full.list) split(dcntry, seq(nrow(dcntry))) else unlist(dcntry$name)
  }else{
    # return nothing if empty
    return(NULL)
  }
}



#' Fetch countries that ends with specified characters
#'
#' Subset and return countries given a specified characters to search
#'
#' @param char character to search for
#' @param full.list whether to return only name of country or full list
#'
#' @return country data list matching a specified character
#'
#' @seealso [countryStartsWith()] for country search starting with specified characters, and [countryHas()] for countries that contain specified characters.
#'
#' @keywords NULL
#'
#' @examples
#' # task 1: get only names of countries that end with "A" or "a"
#' # note that the search in case-insensitive
#' countryEndsWith("A", full.list = F)
#'
#' # task 2: get only names of countries that end with "No" or "no"
#' countryEndsWith("no", full.list = F)
#'
#' # task 3: repeat task 2, but return full list for each country
#' countryEndsWith("no")
#'
#' @export
countryEndsWith <- function(char, full.list = TRUE){
  # filter data
  dcntry <- data.pck.cntry[endsWith(tolower(data.pck.cntry$name),tolower(char)),]
  if(nrow(dcntry)){
    # return results if > 0
    if(full.list) split(dcntry, seq(nrow(dcntry))) else unlist(dcntry$name)
  }else{
    # return nothing if empty
    return(NULL)
  }
}



#' Fetch countries that contains with specified characters
#'
#' Subset to obtain data for countries containing specified characters to search
#'
#' @param char character to search for
#' @param full.list whether to return only name of country or full list
#'
#' @return country data list matching content from a specified character
#'
#' @seealso \code{\link{countryStartsWith}} for country search starting with specified characters, and [countryEndsWith()] for countries that end with a specified characters.
#'
#' @keywords NULL
#'
#' @examples
#' # task 1: get only names of countries that contains with "ER" or "er"
#' # note that the search in case-insensitive
#' countryHas("er", full.list = F)
#'
#' # task 2: get only names of countries that contains with "LAND" or "lAND" or "land"
#' countryHas("lAND", full.list = F)
#'
#' # task 3: repeat task 2, but return full list for each country
#' countryHas("many", full.list = T)
#'
#' @export
countryHas <- function(char, full.list = TRUE){
  # filter data
  dcntry <- data.pck.cntry[grep(tolower(char),tolower(data.pck.cntry$name)),]
  if(nrow(dcntry)){
    # return results if > 0
    if(full.list) split(dcntry, seq(nrow(dcntry))) else unlist(dcntry$name)
  }else{
    # return nothing if empty
    return(NULL)
  }
}

#' Fetch countries data based on official language prefix
#'
#' Obtain country data matching language first one or more letters
#'
#' @param char character to search in languages
#' @param full.list whether to return only name of country or full list
#'
#' @return language list or country data list matching parts of a character search on languages
#'
#' @seealso \code{\link{countryStartsWith}} for country search starting with specified characters, and [countryEndsWith()] for countries that end with a specified characters.
#'
#' @keywords NULL
#'
#' @examples
#' # task 1: get only language names that ends with "EN" or "en"
#' # note that the search in case-insensitive
#' languageStartsWith("eN", full.list = F)
#'
#' # task 2: get only language names that ends with "chi"
#' languageStartsWith("chi", full.list = F)
#'
#' # task 3: repeat task 2, but return full list for each country with the language
#' languageStartsWith("sin", full.list = T)
#'
#' # searching text with no results
#' languageStartsWith("er", full.list = F)
#'
#' @export
languageStartsWith <- function(char, full.list = TRUE){
  # filter data
  dcntry <- data.pck.cntry[startsWith(tolower(data.pck.cntry$officiallanguage),tolower(char)),]
  dcntry <- dcntry[,c("name","officiallanguage")]
  if(nrow(dcntry)){
    # return results if > 0
    if(full.list) split(dcntry, seq(nrow(dcntry))) else rm.na(unique(unlist(dcntry$officiallanguage)))
  }else{
    # return nothing if empty
    return(NULL)
  }
}

rm.na <- function(var) var[!is.na(var)]

#' Fetch countries data with official language ending in specified character
#'
#' Obtain country data matching language first one or more letters
#'
#' @param char character to search in languages
#' @param full.list whether to return only name of country or full list
#'
#' @return language list or country data list matching parts of a character search on languages
#'
#' @seealso \code{\link{countryStartsWith}} for country search starting with specified characters, and [countryEndsWith()] for countries that end with a specified characters.
#'
#' @keywords NULL
#'
#' @examples
#' # task 1: get only language names that ends with "EN" or "en"
#' # note that the search in case-insensitive
#' languageEndsWith("eN", full.list = F)
#'
#' # task 2: get only language names that ends with "chi"
#' languageEndsWith("chi", full.list = F)
#'
#' # task 3: repeat task 2, but return full list for each country with the language
#' languageEndsWith("sin", full.list = T)
#'
#' # searching text with no results
#' languageEndsWith("er", full.list = F)
#'
#' @export
languageEndsWith <- function(char, full.list = TRUE){
  # filter data
  dcntry <- data.pck.cntry[endsWith(tolower(data.pck.cntry$officiallanguage),tolower(char)),]
  dcntry <- dcntry[,c("name","officiallanguage")]
  if(nrow(dcntry)){
    # return results if > 0
    if(full.list) split(dcntry, seq(nrow(dcntry))) else rm.na(unique(unlist(dcntry$officiallanguage)))
  }else{
    # return nothing if empty
    return(NULL)
  }
}

#' Fetch countries data based on official language prefix
#'
#' Obtain country data matching language first one or more letters
#'
#' @param char character to search for
#' @param full.list whether to return only name of country or full list
#'
#' @return country data list matching content from a specified character
#'
#' @seealso \code{\link{countryStartsWith}} for country search starting with specified characters, and [countryEndsWith()] for countries that end with a specified characters.
#'
#' @keywords NULL
#'
#' @examples
#' # task 1: get only names of countries that contains with "ER" or "er"
#' # note that the search in case-insensitive
#' countryHas("er", full.list = F)
#'
#' # task 2: get only names of countries that contains with "LAND" or "lAND" or "land"
#' countryHas("lAND", full.list = F)
#'
#' # task 3: repeat task 2, but return full list for each country
#' countryHas("many", full.list = T)
#'
#' @export
languageHas <- function(char, full.list = TRUE){
  # filter data
  dcntry <- data.pck.cntry[grep(tolower(char),tolower(data.pck.cntry$officiallanguage)),]
  if(nrow(dcntry)){
    # return results if > 0
    if(full.list) split(dcntry, seq(nrow(dcntry))) else unlist(dcntry$name)
  }else{
    # return nothing if empty
    return(NULL)
  }
}


#' Fetch countries by continent
#'
#' Obtain country data matching language first one or more letters
#'
#' @param name name of continent
#' @param full.list whether to return only name of country or full list
#'
#' @return country data list matching continent
#'
#' @details
#' Note that choices for names of continent includes 'asia','europe','africa','north america','south america','oceania'
#'
#'
#' @keywords NULL
#'
#' @examples
#' # task 1: get only names of countries that contains with "ER" or "er"
#' # note that the search in case-insensitive
#' byContinent("africa", full.list = F)
#'
#' # task 2: get only names of countries that contains with "LAND" or "lAND" or "land"
#' byContinent("asia", full.list = F)
#'
#' # task 3: repeat task 2, but return full list for each country
#' byContinent("europe", full.list = T)
#'
#' @export
byContinent <-function(name = c('asia','europe','africa','north america','south america','oceania'), full.list = TRUE){
  # match name of continent
  cnt.name <- match.arg(name)

  # filter data
  dcntry <- data.pck.cntry[grep(tolower(cnt.name),tolower(data.pck.cntry$continent)),c("name","continent")]
  if(nrow(dcntry)){
    # return results if > 0
    if(full.list) split(dcntry, seq(nrow(dcntry))) else unlist(dcntry$name)
  }else{
    # return nothing if empty
    return(NULL)
  }
}

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
names(city_time1) <- city_time1

#' @export
timeOf <- lapply(city_time1, function(cnt){
  message("!!! does not take daylight savings into account yet")
  us.time <- as.POSIXct(Sys.time(), tz = "America/New_York")
  as.POSIXct(as.numeric(unlist(city_time[city_time$City == cnt,]$Timediff)[1]) + us.time)
})


#' @export
continentOf <- lapply(countries1, function(cnt){
  unlist(data.pck.cntry[data.pck.cntry$name==cnt,]$continent)
})

