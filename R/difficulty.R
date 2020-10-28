# Functions to process and display difficulty levels.

#' @rdname format_difficulty
#' @export
#' @format
#' `difficulty_levels` is a character vector of valid difficulty levels.
"difficulty_levels"

difficulty_levels <- c("Novice", "Intermediate", "Advanced")

#' Challenge Difficulty Levels
#'
#' @param params Challenge parameters as `list`.
#'
#' @return
#' `format_difficulty()` returns a character value indicating the challenge difficulty.
#' @export
#'
#' @format
#'
#' @importFrom stringr str_to_title
#'
#' @examples
#' difficulty_levels
#'
#' params <- list(difficulty = "novice")
#' format_difficulty(params)
format_difficulty <- function(params) {
    difficulty <- params$difficulty
    if (is.null(difficulty)) {
        stop("Challenge difficulty is missing")
    }
    difficulty <- str_to_title(difficulty)
    if (!difficulty %in% difficulty_levels) {
        stop("Challenge difficulty should be one of ", deparse(difficulty_levels))
    }
    difficulty
}
