#' Dates
#'
#' @param params Challenge parameters as `list`.
#'
#' @return
#' `format_date_created()` returns a character value indicating the date that a challenge was created.
#'
#' @export
#'
#' @examples
#' params <- list(date = "2020-11-08")
#' format_date_added(params)
format_date_created <- function(params) {
    sprintf("This challenge was created on %s", format(as.Date(params$date), "%B %d, %Y"))
}
