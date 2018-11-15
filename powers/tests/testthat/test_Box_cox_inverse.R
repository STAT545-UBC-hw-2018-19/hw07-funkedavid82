context("Inverse Box cox transformations of some x and lambda.")

test_that("At least a single zero, positive or negative lambda works", {
    x = 1:5
    lambda1 = 0
    lambda2 = 2
    lambda3 = -5

    expect_identical(Box_cox_inverse(x,lambda1), bimixt::boxcox.inv(x,lambda1))
    expect_identical(Box_cox_inverse(x,lambda2), bimixt::boxcox.inv(x,lambda2))
    expect_identical(Box_cox_inverse(x,lambda3), bimixt::boxcox.inv(x,lambda3))
})

test_that("negative vector x automatically and manually converteds to positive", {
    x = -3:3
    lambda4 = 4
    change_neg_to_pos = 7

    #expect_identical(Box_cox_inverse(x,lambda4), bimixt::boxcox.inv(x+4, lambda4))
    expect_identical(Box_cox_inverse(x,lambda4, change_neg_to_pos), bimixt::boxcox.inv(x+7, lambda4))
})
