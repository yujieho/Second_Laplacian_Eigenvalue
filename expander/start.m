% -------------------------------------------------------------------
%  
%  Author:         YU-JIE, HO 
%  Date:           28-May-2020
%  MATLAB version: 9.4.0.813654 (R2018a)
%  Discriptions:
%  
%  Construct the Marguli-Gabber-Galil expander with n*n vertices and 
%  compute its k smallest eigenvalues.
% 
% -------------------------------------------------------------------

n = 150;
k = 10;



% Marguli expander
[G,A] = MarguliExpander(n);



% second smallest eigvalue of normalized Laplacian
[L,eigvec2,eigval2,itrnum] = myeig(A);



% k smallest eigenvalues of Laplacian
% eigvals = eigs(L,k,'sm');



% plot the graph and the eigenvalues
% [h,f] = plotGraph(G,eigvals,eigval2,n);


