# Functions to process and display leaders.

#' Challenge Leaders
#'
#' @param params Challenge parameters as `list`.
#'
#' @return
#' `format_leaders()` returns a character value indicating the challenge leaders.
#' @export
#'
#' @examples
#' leaders <- list(
#'     kevinrue = "Kevin Rue-Albrecht"
#' )
#' params <- list(leaders = list(value = leaders))
#' cat(format_leaders(params), sep = "\n")
format_leaders <- function(params) {
    leaders_list <- params$leaders$value
    leaders_list <- unlist(leaders_list)
    leaders_list <- mapply(.format_github_user, github = names(leaders_list), name = leaders_list)
    leaders_list
}

.format_github_user <- function(github, name) {
        sprintf('- %s - <i class="fab fa-github"></i> [%s](http://github.com/%s)', name, github, github)
    }
