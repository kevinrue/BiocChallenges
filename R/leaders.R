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
    challenge_leaders <- params$leaders
    if (is.null(challenge_leaders)) {
        stop("Challenge leaders are missing")
    }
    challenge_leaders <- unlist(challenge_leaders)
    challenge_leaders <- mapply(.format_github_user, github = names(challenge_leaders), name = challenge_leaders)
    challenge_leaders <- paste0(challenge_leaders, collapse = "\n")
    challenge_leaders
}

.format_github_user <- function(github, name) {
        sprintf('- %s - <i class="fab fa-github"></i> [%s](https://github.com/%s)', name, github, github)
    }
