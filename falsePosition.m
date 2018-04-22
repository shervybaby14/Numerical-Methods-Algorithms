function [root,fx,EA,iter] = falsePosition(func,XL,XU,ES,Maxiter)
%This is a function designed to run the computation for a false position
%algorithm to estimate the root of a function until a desired amount of
%iterations or until the desired error is reached.
%INPUTS:
%func = enter desired function
%XL = Enter lower limit boundary
%XU = Enter Upper limit boundary
%ES = Desired Error
%Maxiter = Maximum amount of iterations desired
%OUTPUTS:
%root = the estimated root of the function
%fx = the function evaluated at the root, should be close to zero
%EA = Relative Absolute Error
%iter = iterations performed
if nargin<3|| nargin>5
    Error('You need three to five inputs')
end
if nargin <4 || isempty (ES)
    ES=0.0001; %Default desired error if not specified
end
if nargin <5 || isempty(Maxiter)
    Maxiter = 200; %Default iterations if not specified
end
%Defining values
format long
iter=0;
EA=100; 
fu=feval(func,XU);  %fu = the function evaluated at X upper limit
fl=feval(func,XL);  %fl = the function evaluated at X lower limit
XR=XL;
%Testing
test=fl*fu;
if test > 0
    error('No Sign Change') %the root has not been bracketed
end
%Begin Computation of Root
while (1)
    Xold=XR;
    XR=XU-(fu*(XL-XU))/(fl-fu); %function for finding the root
    iter=iter+1;
    EA=abs((XR-Xold)/XR)*100; %function for relative absolute error
    test=fl*func(XR);
    if test < 0
        XU=XR; %XR becomes your new upper limit
    elseif test > 0
        XL=XR; %XR becomes your new lower limit
    end
    if EA <= ES || iter >= Maxiter
        break
    end
end
root=XR;
fx=func(XR)
display(EA)
display(iter)
display(root)
end

