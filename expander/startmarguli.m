% -------------------------------------------------------------------
%  
%  Author:         YU-JIE, HO 
%  Date:           28-May-2020
%  MATLAB version: 9.4.0.813654 (R2018a)
%  Discriptions:
%  
%  Construct the Marguli-Gabber-Galil expander with n*n vertices.
%  Compute its k smallest eigenvalues.
% 
% -------------------------------------------------------------------

n = 5;
k = 10;



% adjacency matrix of Marguli expander
A = marguli(n);


% second smallest eigvalue of normalized Laplacian matrix
[eigval2, eigvec2, itrnum] = myeig(A);
leigval2 = 1 - eigval2;



% k smallest eigenvalues of Laplacian
L = speye(n*n) - A;
leigvals  = eigs(L,k,'sm');



% plot the graph and the eigenvalues
G = graph(A,'OmitSelfLoops');
plotgraph(G,n);
ploteigval(leigvals,leigval2);


