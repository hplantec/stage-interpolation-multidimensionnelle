

function[answer] = optimize(X, H, Y, nv, p, np)

sigma1 = 50*rand(np,1);
sigma2 = 50*rand(np,1);
ll1 = 2.5*rand(np,1)+4;
for j = 1 : np
    err(j,:) = moy(X, H, Y, 10^(-ll1(j)), sigma1(j), sigma2(j), nv, p);
    fprintf('%d%%\r', floor(j/np*100))
end

answer = [sigma1,sigma2,ll1,err];