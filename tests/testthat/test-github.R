context("GitHub")

test_that("gh_stargazer_count returns NA for invalid repository", {
    expect_identical(
        gh_stargazer_count("username/repository"),
        NA_integer_
    )
})
