#' Box-Cox Transform Function
#'
#'#' This function gives the Box-Cox transformation of a given variable to any power. I'm making it internal,
#' by not \code{export}ing, because I don't want users to use it.
#' Why not? Because I said so!
#'
#' @param x Vector to be transformed to some power using the box-cox function. This test only works for positive x-values.
#' @param lambda Power to divide and raise \code{x} by. I default it to zero but sould be a single value.
#' @param change_neg_to_pos makes all \code{x} positive by the addition of a constant value. The deefault is 0.
#'
#' @return A vector with a transformed value. It returns \code{log(x)} for lambda equals 0, and \code{(x^lambda - 1) / lambda} for lambda non-zero.


#' @export
Box_cox <- function(x, lambda = 0, change_neg_to_pos = 0) {
    # Checking for errors
    if((change_neg_to_pos < 0)) stop("Please enter a non-negative change_neg_to_pos value.")

    # change_neg_to_pos makes each x positive.
    if(any(x < 0)){
        x = x + change_neg_to_pos
    }

    # Negative values of x are changed to positive by adding the minimum constant value to make each x non-negative.
    if(any(x < 0)){
        x = x + abs(min(x)) + 1
        warning("value of x is made positive by adding the minimum constant value.")
    }

    # Computation of Box-Cox Function
    if(length(lambda) != 1) stop("Please enter a non-matrix vector, length of lambda must be 1")
    if(lambda != 0) return((x^lambda - 1) / lambda)
    else return(log(x))
}

