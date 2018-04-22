function [I] = Simpson(x,y)
%The Simpson function file was created to calculate the integral of area
%given a set of X values, IN INCREASING ORDER, and Y values using the Simpson's 1/3 rule on the
%intervals, except if the number of intervals is odd where the the single
%application trapezoid rule is used on the last interval. 

%Values and Errors

n = length(x);    %n is number of data points of given x values
m = length(y);    
N = n-1;          %N is intervals
if m~=n
    Error('Vectors must be same dimensions')   %Same number of values in both inputs
end
check = diff(x);
if sum(check)~=check(1)*length(check)   %Ensure X values are equally Spaced
    Error('Unequally spaced X values')
end
TrapInt = 0;
if mod(n,2) == 0      %If odd # of intervals, warn user about trap rule on final interval
    warning('Trapezoidal rule will be used for last segment')
    TrapInt = 1;
end

%Calculating Area using Simpsons 1/3 rule

h = (x(n)-x(1));    %height
Int2 = 0;
Int4 = 0;
for i = 2:2:N      %sums of every even interval area
    Int2 = Int2+4*y(i);
end
for i=3:2:N-1      %sums every odd interval area
    Int4=Int4+2*y(i);
end

%Calculate the area of the final trapezoid if odd intervals, or Trap Rule

TrapArea = 0;
if TrapInt == 1
    TrapArea = (x(n)-x(n-1))*((y(n)+y(n-1))/2);  %Area of the Trapezoid
end
I = (h/(3*(N)))*(y(1)+Int2+Int4+y(N))+TrapArea    %Final Integral 

end

