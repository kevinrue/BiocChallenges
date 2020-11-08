context("GitHub")

test_that("gh_stargazer_count returns NA for invalid repository", {
    expect_identical(
        gh_stargazer_count("username/repository"),
        NA_integer_
    )
})

test_that("gh_repositories_info_table can return an empty table", {
    expect_identical(
        gh_repositories_info_table(character(0)),
        data.frame(
            repository = character(0),
            stargazers = integer(0)
        )
    )
})
