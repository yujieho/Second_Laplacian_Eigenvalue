function T = tensorproduct(A)
% -------------------------------------------------------------------
%  
%  T is the tensor product of A with itself.
% 
% -------------------------------------------------------------------

T = kron(A, A);

end