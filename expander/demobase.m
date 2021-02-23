% -------------------------------------------------------------------
%  
%  Author:         YU-JIE, HO 
%  Date:           July-2020
%  MATLAB version: 9.4.0.813654 (R2018a)
%  Discriptions:
%  
%  Construct the base graph for the zig-zag product construction.
% 
% -------------------------------------------------------------------

p = 3;
t = 2;
q = p^t;

itrap = 7;



% the basic graph, APt, which is q^2-regular and has q^16 vertices.
AP0 = affineplane(q);
AP1 = tensorproduct(AP0);

APt = AP1;

for i=2:itrap
    APt = zigzagproduct(APt,AP0,q);
end



% demo affine plane
% G = graph(AP0,'OmitSelfLoops');
% x = repmat(1:q,1,q);
% y = repmat(1:q,q,1);
% y = y(:)';
% gtitle = ['affine plane q = ' num2str(q)];
% plotgraph(G,x,y,gtitle);
% 
% eigval = eig(AP0);
% eigval = 1-eigval(end:-1:1);
% 
% ploteigval(eigval,eigval(2),length(eigval));