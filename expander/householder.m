function N = householder(H,A,v)
% householder transformation

v(1) = v(1) + norm(v);
v    = v / norm(v);

H = speye(length(A)) - 2.*v*v';
N = H*A*H;
N = N(2:end,2:end);

end