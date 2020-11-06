#' Query Information from GitHub API
#'
#' @param repo GitHub repository, formatted as `owner/repo`.
#'
#' @return
#' `gh_stargazer_count()` returns the count of stargazers for a GitHub repository.
#'
#' @export
#'
#' @importFrom gh gh
#'
#' @examples
#' if (interactive()) {
#'     gh_stargazer_count("kevinrue/BiocChallenges")
#' }
gh_stargazer_count <- function(repo) { # nocov start
    value <- tryCatch({
        query <- gh::gh("/repos/:repo", repo = repo)
        as.integer(query$stargazers_count)
        },
        error = function(e) {
            warning(e$message)
            return(NA_integer_)
        }
    )
    value
} # nocov end
