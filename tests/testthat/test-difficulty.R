test_that("format_difficulty works", {

    out <- format_difficulty(params = list(difficulty = "novice"))
    expect_identical(out, "Novice")

})

test_that("format_difficulty detects missing parameter", {

    expect_error(
        format_difficulty(params = list()),
        "Challenge difficulty is missing"
    )

})

test_that("format_difficulty detects invalid parameter value", {

    expect_error(
        format_difficulty(params = list(difficulty = "impossible")),
        "Challenge difficulty should be one of"
    )

})
