% The function optimize2 returns the optimal values of sigma and
% -log10(lambda), using the function moy, for the error L1, L2 or Linf according to i, testing moy np times with np different coefficients.
% We can use this function writting: "optimize2(X, Y, nv, p, np, i)".

function[answer] = optimize2(X, Y, nv, p, np, i)

sigma = rand(np,1)+2;
ll = 10*rand(np,1)+10;
for j = 1 : np
    err(j,:) = moy(X, Y, 10^(-ll(j)), sigma(j), nv, p);
end
coef = [sigma,ll];
answer = coef(find(err(:,i) == min(err(:,i))),:); answer = answer(1,:);

% We found the optimal values of the both parameters
% Finally, answer contains argmin(sigma) , argmin(-log10(lambda)).