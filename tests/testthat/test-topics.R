test_that("format_difficulty works", {

    out <- format_topics(params = list(topics = "Community", "Challenges"))
    expect_identical(out, "- `Community`\n")

})

test_that("format_difficulty detects missing parameter", {

    expect_error(
        format_topics(params = list()),
        "Challenge topics are missing"
    )

})

test_that("format_difficulty detects invalid topic names", {

    expect_error(
        format_topics(params = list(topics = "Seurat")),
        "invalid topics"
    )

})
