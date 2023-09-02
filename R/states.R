countries1 <- countries
names(countries1)=countries1

#' Get country states
#'
#' Fetch all country states
#'
#' @rdname countrystates
#' @format NULL
#' @docType NULL
#' @keywords NULL
#' @export
states<-lapply(countries,function(i){
  rlang::new_function(
    args = rlang::exprs(... = , .noWS = NULL, .renderHook = NULL),
    rlang::expr({
      ggg = !!i
      print(ggg)
      print("heelo")
    }),
    env = asNamespace("quickcode")
  )
})

