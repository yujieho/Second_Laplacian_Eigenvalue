% G0: n=3 Cycle Graph
n = 3;

A0 = ones(n) - eye(n);
A0 = A0./(n-1);

G0 = graph(A0);

g0title = 'G0: n=3 Cycle Graph';

g0t = (0:2)*2*pi/n;
g0x = sin(g0t);
g0y = cos(g0t);

plotgraph(G0,g0x,g0y,g0title);

eigvalA0 = eig(A0);
eigvalA0 = 1-eigvalA0(end:-1:1);

ploteigval(eigvalA0,eigvalA0(2),length(eigvalA0));



% G1: Petersen graph
A1 = petersen();

G1 = graph(A1);

g1title = 'G1: Petersen graph';

g1t = (0:4)*2*pi/5;
g1x = sin(g1t);
g1y = cos(g1t);
g1x = [8*g1x 4*g1x];
g1y = [8*g1y 4*g1y];

plotgraph(G1,g1x,g1y,g1title);

eigvalA1 = eig(A1);
eigvalA1 = 1-eigvalA1(end:-1:1);


ploteigval(eigvalA1,eigvalA1(2),length(eigvalA1));



% G2: Zig-zag product of G1 and G0
A2 = zigzagproduct(A1,A0,2);

G2 = graph(A2);

g2title = 'G2: Zig-zag product of G1 and G0';

g2x = repmat(g0x',1,10) + repmat(g1x,n,1);
g2y = repmat(g0y',1,10) + repmat(g1y,n,1);
g2x = g2x(:)';
g2y = g2y(:)';

plotgraph(G2,g2x,g2y,g2title);

eigvalA2 = eig(A2);
eigvalA2 = 1-eigvalA2(end:-1:1);

ploteigval(eigvalA2,eigvalA2(2),length(eigvalA2));
