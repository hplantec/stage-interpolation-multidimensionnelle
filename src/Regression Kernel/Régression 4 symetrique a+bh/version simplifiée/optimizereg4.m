

function[answer] = optimizereg4(X, H, Y, nv, p, np)

sigma1 = 50*rand(np,1);
sigma2 = 50*rand(np,1);
ll = 2.5*rand(np,1)+4;
for j = 1 : np
    err(j,:) = moyreg4(X, H, Y, 10^(-ll(j)), sigma1(j), sigma2(j), nv, p);
    fprintf('%d%%\r', floor(j/np*100))
end

answer = [ll,sigma1,sigma2,err];