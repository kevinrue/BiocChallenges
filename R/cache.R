#' Caching
#'
#' Caching is used to minimize the number of queries sent to rate-limited APIs such as GitHub.
#'
#' @rdname INTERNAL_cache
#'
#' @return
#' `.get_cache_dir()` returns the path to the global [BiocChallenges-package] cache directory.
#'
#' `.get_cache_repos_dir()` returns the path to the cache subdirectory used to store information about GitHub repositories.
#'
#' `.setup_cache()` initializes a clean cache. It deletes an existing cache, if any.
#'
#' `.get_cache_repo()` returns the path to an RDS file used to store information about a specific GitHub repository.
#'
#' @importFrom rappdirs user_cache_dir
#' @importFrom methods getPackageName
.get_cache_dir <- function() {
    rappdirs::user_cache_dir(appname = getPackageName())
}

#' @rdname INTERNAL_cache
.get_cache_repos_dir <- function() {
    file.path(.get_cache_dir(), "repos")
}

#' @rdname INTERNAL_cache
.setup_cache <- function() {
    cache_dir <- .get_cache_dir()
    if (dir.exists(cache_dir)) {
        unlink(cache_dir, recursive = TRUE)
    }
    dir.create(cache_dir, recursive = TRUE, showWarnings = FALSE)
    message("Initialized clean cache at ", cache_dir)
    cache_repos <- .get_cache_repos_dir()
    dir.create(cache_repos, recursive = TRUE, showWarnings = FALSE)
}

#' @param repo GitHub repository, formatted as `owner/repo`.
#'
#' @rdname INTERNAL_cache
.get_cache_repo <- function(repo) {
    cache_dir <- .get_cache_repos_dir()
    rds_basename <- sprintf("%s.rds", repo)
    file.path(cache_dir, rds_basename)
}

#' Check GitHub Query Results
#'
#' @rdname INTERNAL_valid_github_query
#'
#' @param x The result of a GitHub query.
#'
#' @return A logical scalar.
#' @importFrom methods is
.valid_github_query <- function(x) {
    is(x, "gh_response")
}
