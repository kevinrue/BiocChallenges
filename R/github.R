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
    query <- gh::gh("/repos/:repo", repo = repo)
    as.integer(query$stargazers_count)
} # nocov end
