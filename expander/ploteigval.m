function f = ploteigval(eigvals,eigval2,k)
% -------------------------------------------------------------------
%  
%  plot eigenvalues
% 
% -------------------------------------------------------------------

figure;
f = plot(eigvals);

axis([1 k 0 2])

title(['Exact eigval2 = ' num2str(eigvals(2)) ', Guess eigval2 = ' num2str(eigval2)]);



f.Color      = 'k';
f.Marker     = '.';
f.MarkerSize = 15;
f.LineWidth  = 2;