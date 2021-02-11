% -------------------------------------------------------------------
%  
%  Author:         YU-JIE, HO 
%  Date:           28-May-2020
%  MATLAB version: 9.4.0.813654 (R2018a)
%  Discriptions:
%  
%  Construct the n*n Margulis-Gabber-Galil expander.
%  Compute its k smallest eigenvalues.
% 
% -------------------------------------------------------------------

n = 12;
k = 10;



% adjacency matrix of Margulis expander
A = margulis(n);



% second smallest eigvalue of normalized Laplacian matrix
[eigval2, eigvec2, itrnum] = myeig(A);

leigval2 = 1 - eigval2;



% k smallest eigenvalues of Laplacian
L = speye(n*n) - A;
leigvals  = eigs(L,k,'sm');



% plot the graph and the eigenvalues
G = graph(A,'OmitSelfLoops');

gtitle = ['The ' num2str(n) '*' num2str(n) ' Margulis–Gabber–Galil Expander'];

gx = repmat(1:n,n,1)';
gy = repmat(1:n,n,1);

for i=1:n
    gx(:,i) = circshift(gx(:,i),1-i);
end

gx = gx(:)';
gy = gy(:)';

plotgraph(G,gx,gy,gtitle);

ploteigval(leigvals,leigval2,k);