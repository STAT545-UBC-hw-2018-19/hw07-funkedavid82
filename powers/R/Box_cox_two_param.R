#' Two parameter Box-Cox Transform Function
#'
#'
#'#'#' This function gives the Box-Cox transformation for two parameters from a given variable. I'm making it internal,
#' by not \code{export}ing, because I don't want users to use it.
#' Why not? Because I said so!
#'
#' @param x Vector to be transformed to some power using the two parameter box-cox function.
#' @param lambda1 Power to divide and raise \code{x+lambda2} by. It defaults to zero but could be a vector. This has to be a single value for the function to work.
#' @param lambda2 A shift paramer which also defaults to zero. It should be a single value as well.
#' @param change_neg_to_pos makes all \code{x} positive by the addition of a constant value. The deefault is 0.
#'
#' @return A vector with a transformed value. It returns \code{log(x + lambda2)} for lambda1 equals 0, and \code{((x+lambda2)^lambda1 - 1) / lambda1} for lambda1 non-zero.


#' @export
Box_cox_two_param <- function(x, lambda1 = 0, lambda2 = 0, change_neg_to_pos = 0) {
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

    # Computation of Box-Cox Function for two paramters
    if(length(lambda1) != 1 | length(lambda2) != 1) stop("Please enter a non-matrix vector, length of lambda1 and lambda2 must be 1")
    if(lambda1 != 0) return(((x+lambda2)^lambda1 - 1) / lambda1)
    else return(log(x + lambda2))
}

