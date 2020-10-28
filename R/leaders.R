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
#' params <- list(leaders = list(kevinrue = "Kevin Rue-Albrecht"))
#' cat(format_leaders(params), sep = "\n")
format_leaders <- function(params) {
    leaders_list <- params$leaders
    leaders_list <- unlist(leaders_list)
    leaders_list <- mapply(.format_github_user, github = names(leaders_list), name = leaders_list)
    leaders_list
}

.format_github_user <- function(github, name) {
        sprintf('- %s - <i class="fab fa-github"></i> [%s](https://github.com/%s)', name, github, github)
    }
