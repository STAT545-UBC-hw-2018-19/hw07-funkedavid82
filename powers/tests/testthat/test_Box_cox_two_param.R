context("Two parameter Box cox transformations of some x, lambda1 and lambda2.")

test_that("At least double zeros, positives or negatives lambda1 and lambda2 work", {
    x = 5:10
    lambda0 = 0
    lambda1 = 2
    lambda2 = 3
    lambda3 = -2
    lambda4 = -3

    # Checking to see that this function works when both lambdas are zero
    expect_identical(Box_cox_two_param(x), BIGL:::boxcox.transformation(x, lambda0, lambda0))
    # Checking to see that this function works when one lambda is zero
    expect_identical(Box_cox_two_param(x,lambda4, lambda0), BIGL:::boxcox.transformation(x,lambda4, lambda0))
    expect_identical(Box_cox_two_param(x,lambda3, lambda0), BIGL:::boxcox.transformation(x,lambda3, lambda0))
    # Checking to see that this function works when both lambdas are positive
    expect_identical(Box_cox_two_param(x,lambda1, lambda2), BIGL:::boxcox.transformation(x,lambda1, lambda2))
    # Checking to see that this function works when one lambdas is positive and the other is negative
    expect_identical(Box_cox_two_param(x,lambda1, lambda4), BIGL:::boxcox.transformation(x,lambda1, lambda4))
    expect_identical(Box_cox_two_param(x,lambda3, lambda2), BIGL:::boxcox.transformation(x,lambda3, lambda2))
    # Checking to see that this function works when both lambdas are negative
    expect_identical(Box_cox_two_param(x,lambda3, lambda4), BIGL:::boxcox.transformation(x,lambda3, lambda4))
})


test_that("negative vector x automatically and manually converted to positive.", {
    x = -3:3
    lambda5 = 1
    lambda6 = 3
    change_neg_to_pos = 5
    #expect_identical(Box_cox_two_param(x,lambda5, lambda6), BIGL:::boxcox.transformation(x+4,lambda5, lambda6))
    expect_identical(Box_cox_two_param(x,lambda5, lambda6, change_neg_to_pos), BIGL:::boxcox.transformation(x+5,lambda5, lambda6))
})
