

function[answer] = optimize3(X, H, Y, nv, p, np)

sigma = 4*rand(np,1)+2;
ll = 6*rand(np,1)+3;
for j = 1 : np
    err(j,:) = moy2(X, H, Y, 10^(-ll(j)), sigma(j), nv, p);
end

answer = [sigma,ll,err];