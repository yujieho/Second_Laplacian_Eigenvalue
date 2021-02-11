function A = petersen()

ai = [1 2 3 4 5 1 2 3 4 5 6 7 8 9 10];
aj = [6 7 8 9 10 2 3 4 5 1 8 9 10 6 7];
av = ones(1,15);

A = sparse(ai,aj,av,10,10);
A = A + A';
A = A./3;