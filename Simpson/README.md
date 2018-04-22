Simpson.m
## Purpose
The Simpson function file was created to calculate the integral of area
given a set of X values, IN INCREASING ORDER, and Y values using the Simpson's 1/3 rule on the
intervals, except if the number of intervals is odd where the the single
application trapezoid rule is used on the last interval. 
## Inputs
* func = the function being evaluated
* xl = the lower guess
* xu = the upper guess
* es = the desired relative error (if unspecified, default = 0.0001%)
* maxiter = the desired number of iterations (if unspecified, default = 200)
## Outputs
* root = the estimated root location
* fx = the function evaluated at the root location
* ea = the appropriate relative error (%)
* iter = how many iterations were performed
## Limits
Xl and XU must bracket the root
