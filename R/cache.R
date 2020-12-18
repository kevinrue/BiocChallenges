#' Caching
#'
#' @rdname cache
#'
#' Caching is used to minimize the number of queries sent to rate-limited APIs such as GitHub.
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

#' @rdname cache
.get_cache_repos_dir <- function() {
    file.path(.get_cache_dir(), "repos")
}

#' @rdname cache
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

#' @rdname cache
.get_cache_repo <- function(repo) {
    cache_dir <- .get_cache_repos_dir()
    rds_basename <- sprintf("%s.rds", repo)
    file.path(cache_dir, rds_basename)
}

.valid_github_query <- function(x) {
    is(x, "gh_response")
}
