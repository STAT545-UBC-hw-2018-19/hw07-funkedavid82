context("Box cox transformation of some x and lambda.")

test_that("At least a single zero, positive or negative lambda works", {
    x = 1:5
    lambda1 = 0
    lambda2 = 2
    lambda3 = -5

    expect_identical(Box_cox(x,lambda1), car::bcPower(x,lambda1))
    expect_identical(Box_cox(x,lambda2), car::bcPower(x,lambda2))
    expect_identical(Box_cox(x,lambda3 ), car::bcPower(x,lambda3))
})


test_that("negative vector x automatically and manually converted to positive", {
    x = -3:3
    lambda4 = 5
    change_neg_to_pos = 7

    #expect_identical(Box_cox(x,lambda4), car::bcPower(x+7, lambda4))
    expect_identical(Box_cox(x,lambda4, change_neg_to_pos), car::bcPower(x+7, lambda4))
})
