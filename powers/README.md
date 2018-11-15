
-   [powers](#powers)
    -   [Installation](#installation)
    -   [Examples of functions in the package](#examples-of-functions-in-the-package)
        -   [`square()`](#square)
        -   [`cube()`](#cube)
        -   [`reciprocal()`](#reciprocal)
        -   [`sqroot()`](#sqroot)
        -   [`Box_cox()`](#box_cox)
        -   [`Box_cox_inverse()`](#box_cox_inverse)
        -   [`Box_cox_two_param()`](#box_cox_two_param)
    -   [For Developers](#for-developers)

<!-- README.md is generated from README.Rmd. Please edit that file -->
powers
======

This is an R package originally developed by `Vincenzo Coia`, which gives `sqrt()` friends by providing other power functions. I have included in this package, families of `Box Cox Transformation` for one and two parameter and similarly gave an additional function called `Inverse Box Cox Transform`. These functions give the power transformation of the data values *x* with respect to parameter(s) *λ*.

Installation
------------

You can install my version of the powers package on github from:

``` r
# install.packages("devtools")
devtools::install_github("https://github.com/STAT545-UBC-students/hw07-funkedavid82/tree/master/powers")
```

Examples of functions in the package
------------------------------------

I am showing simple examples here, but my `vignette.Rmd` gave a comprehensive direction of use.

### `square()`

``` r
#The chunk code here shows the square of numbers 1 to 5, i.e x^2.
powers::square(c(1,2,3,4,5))
#> [1]  1  4  9 16 25
```

### `cube()`

Similarly, the chunk code here shows the cube of numbers 1 to 5, i.e *x*<sup>3</sup>.

``` r

powers::cube(c(1,2,3,4,5))
#> [1]   1   8  27  64 125
```

### `reciprocal()`

Also, the chunk code here shows the reciprocal of numbers 1 to 5, i.e *x*<sup>−</sup>1 or 1/*x*.

``` r
powers::reciprocal(c(1,2,3,4,5))
#> [1] 1.0000000 0.5000000 0.3333333 0.2500000 0.2000000
```

### `sqroot()`

Again, the code here shows the square root of some numbers, i.e $\\sqrt(x)$.

``` r
powers::sqroot(c(2,4,9,16,25))
#> [1] 1.414214 2.000000 3.000000 4.000000 5.000000
```

Here, I will also give simple examples of the `Box Cox Transform` calling the power package. I will test the function based on negative, zero and positive parameters and values of *x*.

### `Box_cox()`

``` r
x = 1:5 #positive data values. This could be zero or negative.
lambda = 2 #the measure of strength of the function. We have set this to give an error message if the length of lambda is greater than 1. This function is basically meant for a single value of lambda.
powers::Box_cox(x, lambda) #the function Box_cox is called from the powers package
#> [1]  0.0  1.5  4.0  7.5 12.0
```

Here, I am giving examples of how the function respond to negative values of *x* compared with positive values. If there is no `change_neg_to_pos` specified, then the function will automatically add the possible minimum constant to make all values of *x* positive.

``` r
powers::Box_cox(x = -5:5, lambda = 1)
#> Warning in powers::Box_cox(x = -5:5, lambda = 1): value of x is made
#> positive by adding the minimum constant value.
#>  [1]  0  1  2  3  4  5  6  7  8  9 10
```

In the code below, specifying a `change_neg_to_pos` gives some flexibility on which number to add to each value of *x* to make them positive.

``` r
powers::Box_cox(x = -5:5, lambda = 1, change_neg_to_pos = 7)
#>  [1]  1  2  3  4  5  6  7  8  9 10 11
```

### `Box_cox_inverse()`

Here, I consider the inverse of the previous function called `Inverse Box Cox Transform`. We denote the function by `Box_cox_inverse()`.

``` r
powers::Box_cox_inverse(x = 1:5, lambda = 1)
#> [1] 2 3 4 5 6
```

Just like we did for the previous function, we can use the function with/without `change_neg_to_pos`. Here is an example;

``` r
powers::Box_cox_inverse(x = -3:3, lambda = 2) #this uses the minimum possible constant for change_neg_to_pos.
#> Warning in powers::Box_cox_inverse(x = -3:3, lambda = 2): value of x is
#> made positive by adding the minimum constant value.
#> [1] 1.732051 2.236068 2.645751 3.000000 3.316625 3.605551 3.872983
powers::Box_cox_inverse(x = -3:3, lambda = 2, change_neg_to_pos = 4) #it uses the specified change_neg_to_pos.
#> [1] 1.732051 2.236068 2.645751 3.000000 3.316625 3.605551 3.872983
```

### `Box_cox_two_param()`

Finally, I consider the boxcox function involving two parameters called `Two Parameter Box Cox Transform`. We denote the function by `Box_cox_two_param()`. This function requires two parameters *λ*<sub>1</sub> and *λ*<sub>2</sub> to input.

``` r
powers::Box_cox_two_param(x = 1:3, lambda1 = 2, lambda2 = 3)
#> [1]  7.5 12.0 17.5
```

Again, from previous functions and examples, we may or may not specify `change_neg_to_pos`. Here is an example of what I mean;

``` r
powers::Box_cox_two_param(x = -1:3, lambda1 = 2, lambda2 = 3) #possible minimum constant added to all negative values of x since no change_neg_to_pos is specified. And this gives a warning message. The minimum possible constant here is 2, therefore, specifying a change_neg_to_pos 2 and not specifying change_neg_to_pos atall should give similar results.
#> Warning in powers::Box_cox_two_param(x = -1:3, lambda1 = 2, lambda2 = 3):
#> value of x is made positive by adding the minimum constant value.
#> [1]  7.5 12.0 17.5 24.0 31.5
powers::Box_cox_two_param(x = -1:3, lambda1 = 2, lambda2 = 3, change_neg_to_pos = 2) #change_neg_to_pos of 2 added to all negative values of x.
#> [1]  7.5 12.0 17.5 24.0 31.5
```

For Developers
--------------

(Again, I don't actually intend for anyone to develop this silly package, but if I did, here's what I'd write.)

Use the internal `pow` function as the machinery for the front-end functions such as `square`, `cube`, and `reciprocal`.
