function [L,U,P] = luFactor(A)
%This is a matlab function file to decompose a given, square matrix A, into a lower
%and upper triangular matrix while changing the P identity matrix as
%needed.
[m,n]=size(A)
if nargin<1     %Can only have one matrix
    error('Only one matrix accepted')
end
if n<2 || m<2 %The inputs must create a matrix
    error('Must input a matrix')
end
if n~=m    %This LU factorization only works for square matricies
    error('The inputed matrix must be square')
end
 
    L=eye(m,n); %Creates a matrix with ones across the main diagonal and zeros elsewhere
    U=A;   %The Upper triangular matrix will be equal to the changing A matrix
    P=L; %P is changing matrix with matrix L
    p=P;  %Set assigned, unchanging matricies
    a=A;  %Set assigned, unchanging matricies
    for k = 1:n-1   %indexing for columns
        for j = k:n-1    %indexing for rows
            if abs(U(k,k)) < abs(U(j+1,k))   %Checking to see if the number in the second row below a11 is greater abs value to avoid divide by zero
                U(k,:) = a(j+1,:);U(j+1,:)=a(k,:);  %Create a changing U matrix with j columns and i rows
                P(k,:)=p(j+1,:); P(j+1,:)=p(k,:);  %Create a changing P matrix with j columns and i rows
                L(j+1,k)=(U(j+1,k)/U(k,k));  %Replacing the lower triangular part of the L matrix with the coefficients used to multiply and cancel
                U(j+1,:)=U(j+1,:)-U(k,:).*(U(j+1,k)/U(k,k)); %Multiplying by a11/a22 so that when we subtract we get zero
                
            else
                L(j+1,k)=(U(j+1,k)/U(k,k)); %if pivot is not needed, you can go ahead and just multiply and eliminate and use the multipliers for L
                U(j+1,:)=U(j+1,:)-U(k,:).*(U(j+1,k))/U(k,k);  %if pivot is not needed, just change the U matrix accordingly
                
            end
            a=U;
            p=P;
        end
    end
    display(U)
    display(A)
    display(P)
    display(L)
end

