### False Position
## Purpose 





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
