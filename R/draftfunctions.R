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


countryEndsWith <- function(char)
    countryHas <- function(char)

      languageStartsWith <- function(char)
        languageEndsWith <- function(char)

          languageOf <- lapply(countries1, function(cnt){})
populationOf <- lapply(countries1, function(cnt){})
callingCodeOf <- lapply(countries1, function(cnt){})
currencyOf <- lapply(countries1, function(cnt){})
timeOf <- lapply(countries1, function(cnt){})
continentOf <- lapply(countries1, function(cnt){})

