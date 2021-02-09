function h = plotgraph(G,n)

% plot graph G



figure;
h = plot(G);

title(['The ' num2str(n) '*' num2str(n) ' Margulis–Gabber–Galil Expander']);

x = zeros(1,n*n);
for i=0:n-1,
    x(i*n+1:(i+1)*n) = circshift(1:n,-i);
end

y = repmat(1:n,n,1);
y = y(:)';


h.XData     = x;
h.YData     = y;
h.NodeLabel = {};
h.NodeColor = 'k';
h.EdgeColor = 'k';
h.LineWidth = 0.1*G.Edges.Weight;


    
end