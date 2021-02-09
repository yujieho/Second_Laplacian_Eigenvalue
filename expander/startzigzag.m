% -------------------------------------------------------------------
%  
%  Author:         YU-JIE, HO 
%  Date:           July-2020
%  MATLAB version: 9.4.0.813654 (R2018a)
%  Discriptions:
%  
%  Construct expanders using the zig-zag product construction.
% 
% -------------------------------------------------------------------

q = 3;
itr = 3;


G0 = basicgraph(q);
G1 = tensorproduct(G0);

Gt = G1;
for i=2:itr
    Gt = zigzagproduct(Gt,G0,q);
end