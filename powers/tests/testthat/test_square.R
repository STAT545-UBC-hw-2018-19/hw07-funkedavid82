context("Squaring non-numerics")

test_that("At least numeric values work.", {
    num_vec <- c(0, -4.6, 3.4)
    expect_identical(square(num_vec), num_vec^2)
    expect_identical(cube(num_vec), num_vec^3)
    expect_identical(reciprocal(num_vec), 1/num_vec)
    expect_identical(sqroot(num_vec), num_vec^(1/2))
})

test_that("Logicals automatically convert to numeric.", {
    logic_vec <- c(TRUE, TRUE, FALSE)
    expect_identical(square(logic_vec), logic_vec^2)
    expect_identical(cube(logic_vec), logic_vec^3)
    expect_identical(reciprocal(logic_vec), 1/logic_vec)
    expect_identical(sqroot(logic_vec), logic_vec^(1/2))
})
