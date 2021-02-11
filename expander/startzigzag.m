% -------------------------------------------------------------------
%  
%  Author:         YU-JIE, HO 
%  Date:           July-2020
%  MATLAB version: 9.4.0.813654 (R2018a)
%  Discriptions:
%  
%  Construct expander families using the zig-zag product construction.
% 
% -------------------------------------------------------------------

q     = 25;
itrap = 7;
itrzz = 5;


% construct the basic graph, APt, which is q^2-regular and has q^16 vertices.
AP0 = affineplane(q);
AP1 = tensorproduct(AP0);

APt = AP1;

for i=2:itrap
    APt = zigzagproduct(APt,AP0,q);
end


% 
% % construct a expander family
% A0 = APt;
% A1 = A0*A0;
% A2 = tensorproduct(A0);