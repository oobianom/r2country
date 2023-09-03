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


#Functions
countryStartsWith <- function(char)
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

