

function[answer] = optimize3(X, H, Y, nv, p, np)

sigma1 = 4*rand(np,1)+2;
sigma2 = 4*rand(np,1)+2;
ll1 = 6*rand(np,1)+3;
ll2 = 6*rand(np,1)+3;
for j = 1 : np
    err(j,:) = moy2(X, H, Y, 10^(-ll1(j)),10^(-ll2(j)), sigma1(j),sigma2(j), nv, p);
    fprintf('%d%%\r', floor(j/np*100))
end

answer = [sigma1,sigma2,ll1,ll2,err];