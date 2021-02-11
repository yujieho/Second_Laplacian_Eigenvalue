function [Z,A,B] = zigzagproduct(G, H, q)
% -------------------------------------------------------------------
%  
%  Z is the zig-zag product of G (the big graph) and H (the small graph).
%  Z has |G|*|H| vertices and its degree is q^2, where q is the 
%  degree of H.
% 
% -------------------------------------------------------------------


g = length(G);
h = length(H);

[gj, ~]      = find(G);
[hj, hi, hv] = find(H);



ai = zeros(h*q,g);
aj = zeros(h*q,g);
av = repmat(hv',1,g);

for i=0:g-1,
    ai(:,i+1) = hi + h*i;
    aj(:,i+1) = hj + h*i;
end

% edges in each cloud
A = sparse(ai,aj,av,g*h,g*h);



bi = 1:g*h;
bj = 1:g*h;
bv = ones(1,g*h);

for i=1:g*h
    if bj(h*(gj(i)-1)+h) == h*(gj(i)-1)+h
        for j=1:h
            idx = h*(gj(i)-1)+j;
            if bj(idx) == idx
                bj(i)   = idx;
                bj(idx) = i;
                break;
            end
        end
    end
end

% crossing the clouds
B = sparse(bi,bj,bv,g*h,g*h);



% zig-zag product
Z = A*B*A;