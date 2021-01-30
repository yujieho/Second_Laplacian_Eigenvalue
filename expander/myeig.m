function [L,eigvec2,eigval2,itrnum] = myeig(A)
% -------------------------------------------------------------------
%  
%  Author:         YU-JIE, HO 
%  Date:           28-May-2020
%  MATLAB version: 9.4.0.813654 (R2018a)
%  Discriptions:
%  
%  Compute the second smallest normalized Laplacian eigenvalue and 
%  its eigenvector using householder deflation and power iteration.
%
%  The matrix Q is related to the normalized Laplacian L, where 
%  the eigval(L) = 1 - eigval(Q), and 
%  the eigvec(L) = D^(-1)*eigvec(Q).
%
% -------------------------------------------------------------------

eigvec1 = sqrt(sum(A))';

D = spdiags(1./eigvec1,0,length(A),length(A));
Q = D*A*D;
L = speye(length(A)) - Q;


% Wielandt deflation
eigvec1 = eigvec1 / norm(eigvec1);
N = Q - 1.*eigvec1*eigvec1';



% rayleigh quotient iteration
[eigvec2,eigval2,itrnum] = power_iteration(N);

eigval2 = 1 - eigval2;
