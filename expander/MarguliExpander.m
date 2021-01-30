% -------------------------------------------------------------------
%  
%  Author:         YU-JIE, HO 
%  Date:           28-May-2020
%  MATLAB version: 9.4.0.813654 (R2018a)
%  Discriptions:
%  
%  Construct the adjacency matrix of a Marguli-Gabber-Galil Expander.
%  
%  For a vertex (a,b), it is connect to
%  (a, b+-1), (a+-1, b), (a, b+-a), (a+-b, b)
%  
%  Self-loops are obmit.
%  Negative connections are obmit for duplicate.
%  (This graph still has multi-edges.)
% 
% -------------------------------------------------------------------
function [G,A] = MarguliExpander(n)

ai = repmat(1:n*n,1,4);
av = ones(1,n*n*4);

aj = zeros(n*n,4);
for i=1:n*n,
    tmx = floor((ai(i)-1)/n);
    tmy = mod(ai(i)-1,n);
    
    % connect to the vertices (a, b+1)
    aj(i,1) = mod(tmy+1,n) + n*tmx +1;

    % connect to the vertices (a+1, b)
    aj(i,2) = tmy + n*mod(tmx+1,n) +1;
    
    % connect to the vertices (a, b+a)
    aj(i,3) = mod(tmx+tmy,n) + n*tmx + 1;
    
    % connect to the vertices (a+b, b)
    aj(i,4) = tmy + n*mod(tmx+tmy,n) + 1;

end
aj = aj(:)';



% adjacency matrix
A = sparse(ai,aj,av,n.^2,n.^2);
A = A + A';


% weighted graph without self-loops
A = A -diag(diag(A));
G = graph(A);

end


