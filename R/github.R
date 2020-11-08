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

#' Tabulate Information for GitHub Repositories
#'
#' @param repos Character vector of GitHub repositories, each formatted as `owner/repo`.
#'
#' @return A `data.frame` with the following columns:
#' \describe{
#' \item{`repository`}{HTML content representing a link to the GitHub repository.}
#' \item{`stargazers`}{Integer count of stargazers on the GitHub repository.}
#' }
#' @export
#'
#' @examples
#' if (interactive()) {
#'     gh_repositories_info_table("kevinrue/BiocChallenges")
#' }
gh_repositories_info_table <- function(repos) {
    column_link <- sprintf('<i class="fab fa-github"></i> [%s](https://github.com/%s)', repos, repos)
    column_stargazers <- vapply(repos, BiocChallenges::gh_stargazer_count, integer(1))
    tab <- data.frame(
        repository = column_link,
        stargazers = column_stargazers
    )
    tab <- tab[order(tab$stargazers, decreasing = TRUE), ]
    tab
}
