test_that("format_difficulty works", {

    out <- format_date_created(params = list(date = "2020-11-08"))
    expect_identical(out, "This challenge was created on November 08, 2020")

})
