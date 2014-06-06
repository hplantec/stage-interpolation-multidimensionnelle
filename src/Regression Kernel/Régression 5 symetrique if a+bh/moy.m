

function[erm] = moy(X, H, Y, lambda, sigma1, sigma2, sigma3, nv, p)

n = size(X,1); pn = floor(p*n);
erm = zeros(1,3);
% First of all, we initialize erm at 0.

for s = 1 : nv  % nv regressions
    
    L1 = transpose(randperm(n));
    L2 = transpose(1 : pn);
    L3 = transpose(pn+1 : n);
    
    % L2 is a vector containing pn different numbers smaller than n.
    % L3 is a vector containing exactly the other one.
    
    L = L1(L2,1);
    Xtr = X(L,:);
    Htr = H(L,:);
    Ytr = Y(L,:);
    % the proportion of (Xtr,Ytr) in (X,Y) is p.
    
    L = L1(L3,1);
    Xte = X(L,:);
    Hte = H(L,:);
    Yte = Y(L,:);
    % the proportion of (Xte,Yte) in (X,Y) is 1-p.
    
    errorm = 1-pred2(Xtr,Htr,Ytr,Xte,Hte,lambda,sigma1,sigma2,sigma3)./Yte;
    erm = erm + [mean(abs(errorm)),sqrt(mean(errorm.^2)),max(abs(errorm))];
    % erm is the sum of the errors of all the predictions.
end

erm = erm/nv;
% Finally, erm is the mean error of prediction.