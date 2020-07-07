function B=DivideColumns(N)
% Avoiding creating too large a matrix
if nargin<1 || N >2500 
      N = 500;
end
tic
A = 1./hilb(N);
c = 1:N;
B = A; % So that we don't overwrite A
T1 = toc;
tic
for i=1:N
    B(:,i) = B(:,i)/c(i);
end
T2 = toc;
S1 = sprintf('Constructing the %d by %d ...A matrix took %f seconds.', N, N, T1);
S2 = sprintf('\nDividing the columns of A ...by elements of c took %f seconds', T2);
disp([S1 S2])