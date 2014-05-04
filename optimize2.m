% The function optimize2 returns the optimal values of sigma and
% -log10(lambda), using the function moy.
% We can use this function writting: "optimize2(X, Y, nv, p, np)".

function[answer] = optimize2(X, Y, nv, p, np)

sigma = rand(np,1)+2;
ll = 10*rand(np,1)+10;
for i = 1 : np
    err(i,1) = moy(X, Y, 10^(-ll(i)), sigma(i), nv, p);
end
scatter3(sigma,ll,err)
coef = [sigma,ll];
answer = coef(find(err == min(err)),:); answer = answer(1,:);

% We found the optimal values of the both parameters
% Finally, answer contains argmin(sigma) , argmin(-log10(lambda)).