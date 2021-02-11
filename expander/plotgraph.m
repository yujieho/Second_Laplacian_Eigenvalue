function h = plotgraph(G,x,y,gtitle)
% -------------------------------------------------------------------
%  
%  plot graph G
% 
% -------------------------------------------------------------------

figure;
h = plot(G);

title(gtitle);

h.XData     = x;
h.YData     = y;

h.NodeLabel = {};
h.NodeColor = 'k';
h.EdgeColor = 'k';

h.LineWidth = 0.1*G.Edges.Weight;