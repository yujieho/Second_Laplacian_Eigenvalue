function [h,f] = plotGraph(G,eigvals,eigval2,n)



% plot graph G with n*n vertices
figure;
h = plot(G);

title(['The ' num2str(n) '*' num2str(n) ' Margulis–Gabber–Galil Expander']);

x = zeros(1,n*n);
for i=0:n-1,
    x(i*n+1:(i+1)*n) = circshift(1:n,-i);
end
y = repmat(1:n,n,1);
y = y(:)';

h.XData = x;
h.YData = y;

h.NodeColor = 'k';
h.NodeLabel = {};
h.EdgeColor = 'k';
h.LineWidth = 0.1*G.Edges.Weight;



% plot eigenvalues      
figure;
f = plot(eigvals);

axis([1 10 0 2])
title(['Exact eigval2 = ' num2str(eigvals(2)) ', Guess eigval2 = ' num2str(eigval2)]);

f.Color  = 'k';
f.Marker = '.';
f.MarkerSize = 15;
f.LineWidth  = 2;
    
end

