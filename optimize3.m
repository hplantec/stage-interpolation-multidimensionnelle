% The function optimize2 returns the optimal values of sigma and
% -log10(lambda), using the function moy, for the error L1, L2 or Linf according to i, testing moy np times with np different coefficients.
% We can use this function writting: "optimize2(X, Y, nv, p, np, i)".

function[answer] = optimize2(X, Y, nv, p, np)

sigma = 3*rand(np,1)+1;
ll = 6*rand(np,1)+3;
for j = 1 : np
    err(j,:) = moy(X, Y, 10^(-ll(j)), sigma(j), nv, p);
end

answer = [sigma,ll,err];