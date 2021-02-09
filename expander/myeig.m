function [eigval2,eigvec2,itrnum] = myeig(A)
% -------------------------------------------------------------------
%  
%  Author:         YU-JIE, HO 
%  Date:           28-May-2020
%  MATLAB version: 9.4.0.813654 (R2018a)
%  Discriptions:
%  
%  Compute the second largest normalized adjacency eigenvalue 
%  using Wielandt deflation and power iteration with Rayleigh quotient.
%
%  The matrix Q is related to the normalized Laplacian L, where 
%  the eigval(L) = 1 - eigval(Q), and 
%  the eigvec(L) = D^(-1)*eigvec(Q).
%
% -------------------------------------------------------------------

eigvec1 = sqrt(sum(A))';
eigvec1 = eigvec1 / norm(eigvec1);


% Wielandt deflation
N = A - eigvec1*eigvec1';


% rayleigh quotient iteration
[eigval2, eigvec2, itrnum] = poweriteration(N);