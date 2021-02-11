function N = householder(H,A,v)
% -------------------------------------------------------------------
%  
%  householder transformation
%  
%  For a given matrix A:
%      v is the eigenvector of the largest eigenvalue.
%      H is the householder matrix.
%      N is the matrix with same eigenvalues of A, but without the largest one.
% 
% -------------------------------------------------------------------

v(1) = v(1) + norm(v);
v    = v / norm(v);

H = speye(length(A)) - 2.*v*v';
N = H*A*H;
N = N(2:end,2:end);