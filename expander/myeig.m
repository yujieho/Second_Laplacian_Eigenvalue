function [eigval2,eigvec2,itrnum] = myeig(A)
% -------------------------------------------------------------------
%  
%  Author:         YU-JIE, HO 
%  Date:           28-May-2020
%  MATLAB version: 9.4.0.813654 (R2018a)
%  Discriptions:
%  
%  Compute the second largest (in absolute value) normalized adjacency 
%  eigenvalue using Wielandt deflation and power iteration with
%  Rayleigh quotient.
%
%  N is a matrix with same eigenvalues of A except the largest one of A
%  is set to 0.
%
% -------------------------------------------------------------------

% Wielandt deflation
N = A - 1/length(A);

% rayleigh quotient iteration
[eigval2, eigvec2, itrnum] = poweriteration(N);