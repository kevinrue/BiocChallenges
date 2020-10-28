test_that("format_difficulty works", {

    leaders <- list(
        kevinrue = "Kevin Rue-Albrecht"
    )

    out <- format_leaders(params = list(
        leaders = list(kevinrue = "Kevin Rue-Albrecht")
    ))
    expect_match(out, "Kevin Rue-Albrecht")
    expect_match(out, "https://github.com/kevinrue")

})

test_that("format_leaders detects missing parameter", {

    expect_error(
        format_leaders(params = list()),
        "Challenge leaders are missing"
    )

})
