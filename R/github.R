#' Query Information from GitHub API
#'
#' @rdname gh_queries
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
#'     gh_latest_push_datetime("kevinrue/BiocChallenges")
#' }
gh_stargazer_count <- function(repo) { # nocov start
    query <- .cache_github_repo(repo)
    if (is.na(query)) return(NA_integer_)
    value <- as.integer(query$stargazers_count)
    value
} # nocov end

#' @rdname gh_queries
#'
#' @return
#' `gh_latest_push_datetime()` returns the character representation of the datetime for the latest push to a GitHub repository.
#' @export
#' @importFrom lubridate as_datetime
gh_latest_push_datetime <- function(repo) { # nocov start
    query <- .cache_github_repo(repo)
    if (is.na(query)) return(NA_character_)
    value <- as.character(as_datetime(query$pushed_at, tz = "GMT"))
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
    column_latest_push <- vapply(repos, BiocChallenges::gh_latest_push_datetime, character(1))
    tab <- data.frame(
        "repository" = column_link,
        "stargazers" = column_stargazers,
        "latest push" = column_latest_push
    )
    tab <- tab[order(tab$stargazers, decreasing = TRUE), ]
    tab
}

.cache_github_repo <- function(repo) {
    cache_file <- .get_cache_repo(repo)
    if (file.exists(cache_file)) {
        value <- readRDS(cache_file)
        return(value)
    }
    warning("Querying github")
    value <- tryCatch({
        query <- gh::gh("/repos/:repo", repo = repo)
        query
        },
        error = function(e) {
            warning(e$message)
            return(NA)
        }
    )
    dir.create(dirname(cache_file), recursive = TRUE, showWarnings = FALSE)
    saveRDS(value, cache_file)
    value
}
