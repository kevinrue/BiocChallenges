# Available topics

#' @rdname format_topics
#' @export
#' @format
#' `topic_tags` is a character vector of valid topic tags.
"topic_tags"

#' @importFrom utils data
#' @importFrom graph nodes
.get_topic_tags <- function(){
    biocViewsVocab <- NULL
    data("biocViewsVocab",
         package = "biocViews",
         envir = environment())
    c("Challenges",
      "Community",
      "Instrumentation",
      sort(nodes(biocViewsVocab)))
}
topic_tags <- .get_topic_tags()

#' Challenge Topics
#'
#' @param params Challenge parameters as `list`.
#'
#' @return
#' `format_topics()` returns a character value indicating the challenge topic tags.
#' @export
#'
#' @examples
#' topic_tags
#'
#' params <- list(topics = c("Challenges", "Community"))
#' cat(format_topics(params))
format_topics <- function(params) {
    challenge_topics <- params$topics
    if (is.null(challenge_topics)) {
        stop("Challenge topics are missing")
    }
    if (!all(challenge_topics %in% topic_tags)) {
        invalid <- setdiff(challenge_topics, topic_tags)
        invalid <- paste0(invalid, collapse = ", ")
        invalid <- strwrap(invalid, width = 60, prefix = "  ", initial = "  ")
        msg <- sprintf("invalid topics:\n%s", invalid)
        stop(msg)
    }
    challenge_topics <- sprintf("- `%s`\n", challenge_topics)
    challenge_topics <- paste0(challenge_topics, collapse = "\n")
    challenge_topics
}
