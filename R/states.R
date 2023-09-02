countries1 <- countries
names(countries1)=countries1

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
      print(ggg)
      print("heelo")
    }),
    env = asNamespace("quickcode")
  )
})

