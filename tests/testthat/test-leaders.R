test_that("format_difficulty works", {

    leaders <- list(
        kevinrue = "Kevin Rue-Albrecht"
    )

    out <- format_leaders(params = list(leaders = list(value = leaders)))
    expect_match(out, "Kevin Rue-Albrecht")
    expect_match(out, "https://github.com/kevinrue")

})
