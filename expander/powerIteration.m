function [eigval,eigvec,i] = poweriteration(A)
% -------------------------------------------------------------------
%  
%  Author:         YU-JIE, HO 
%  Date:           28-May-2020
%  MATLAB version: 9.4.0.813654 (R2018a)
%  Discriptions:
%  
%  Return a eigenvalue and its eigenvector using power iteration
%  and Rayleigh quotient.
%  i is the number of iretation to which eigval converge.
%
% -------------------------------------------------------------------

itr    = 150;
eigval = 10;
eigvec = [1;1;1;zeros(length(A)-3,1)];

threshold = 1e-4;

for i = 1:itr,
    neweigvec = A*eigvec;
    eigvec    = neweigvec / max(neweigvec);
    
    eigvalnew = (eigvec'*A*eigvec) / ((eigvec'*eigvec));
    
    if abs(eigvalnew - eigval) < threshold,
        break;
    else
        eigval = eigvalnew;
    end
end