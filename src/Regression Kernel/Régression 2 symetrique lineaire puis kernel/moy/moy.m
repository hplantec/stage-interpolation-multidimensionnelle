% The function moy applies nv regressions with the function error training
% on the proportion p of (X,Y) and testing on the proportion 1-p of (X,Y).
% Sigma is the standard deviation of the normal and lambda the
% smoothness indicator.
% We can use this function writting: "moy(X, Y, lambda, sigma, nv, p)".

function[erm] = moy(X, Y, lambda, sigma, nv, p)

n = size(X,1); pn = floor(p*n);
erm = 0;
% First of all, we initialize erm at 0.

for s = 1 : nv  % nv regressions
    
    L1 = transpose(randperm(n));
    L2 = transpose(1 : pn);
    L3 = transpose(pn+1 : n);
    
    % L2 is a vector containing pn different numbers smaller than n.
    % L3 is a vector containing exactly the other one.
    
    L = L1(L2,1);
    Xtr = X(L,2 : 8);
    Ytr = Y(L,4);
    % the proportion of (Xtr,Ytr) in (X,Y) is p.
    
    L = L1(L3,1);
    Xte = X(L,2 : 8);
    Yte = Y(L,4);
    % the proportion of (Xte,Yte) in (X,Y) is 1-p.
    
    erm = erm + errorm(Xtr, Ytr, Xte, Yte, lambda, sigma);
    % erm is the sum of the errors of all the predictions.
end

erm = erm/nv;
% Finally, erm is the mean error of prediction.