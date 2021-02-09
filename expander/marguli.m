function A = marguli(n)
% -------------------------------------------------------------------
%  
%  A is the normalized adjacency matrix of Marguli-Gabber-Galil Expander.
%  
%  For a vertex (a,b), it is connect to
%  (a, b+-1), (a+-1, b), (a, b+-a), (a+-b, b).
%  
%  This graph has multi-edges and self-loops.
%  
% -------------------------------------------------------------------

ai = repmat(1:n*n,4,1);
aj = zeros(4,n*n);
av = ones(1,n*n*4);

for i=1:n*n
    tmx = floor((i-1)/n);
    tmy = mod(i-1,n);
    
    % connect to the vertices (a, b+1)
    aj(1,i) = mod(tmy+1,n) + n*tmx +1;

    % connect to the vertices (a+1, b)
    aj(2,i) = tmy + n*mod(tmx+1,n) +1;
    
    % connect to the vertices (a, b+a)
    aj(3,i) = mod(tmx+tmy,n) + n*tmx + 1;
    
    % connect to the vertices (a+b, b)
    aj(4,i) = tmy + n*mod(tmx+tmy,n) + 1;

end
ai = ai(:)';
aj = aj(:)';


A = sparse(ai,aj,av,n*n,n*n);


% the subtraction part
A = A + A';


% normalize
A = A./8;

end


