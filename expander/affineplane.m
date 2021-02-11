function A = affineplane(q)
% -------------------------------------------------------------------
%  
%  Construct a graph A for the basic graph in the zig-zag product construction.
%  Here A is the normalized adjacency matrix of the affine plane.
%  A is a (q*q, q, 1/q^{1/2})-graph.
%  A has self-loops.
% 
% -------------------------------------------------------------------

ai = repmat(1:q*q,q,1);
aj = zeros(q,q*q);
av = ones(1,q*q*q);

for i=1:q*q
    tmx = floor((i-1)/q);
    tmy = mod(i-1,q);
    aj(:,i) = (0:q-1)'.*q + mod((0:q-1)'.*tmx - tmy, q) + 1;
end

ai = ai(:)';
aj = aj(:)';

A = sparse(ai,aj,av,q*q,q*q);

A = A./q;