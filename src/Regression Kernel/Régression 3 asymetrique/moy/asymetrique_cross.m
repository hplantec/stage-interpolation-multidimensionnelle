

function[resultat] = asymetrique_cross(X, Y, lambda, sigma, c, nv, p)

n = size(X,1); pn = floor(p*n);
erm = 0;
prop = 0;
% First of all, we initialize erm at 0.

for s = 1 : nv  % nv regressions
    
    L1 = transpose(randperm(n));
    L2 = transpose(1 : pn);
    L3 = transpose(pn+1 : n);
    
    % L2 is a vector containing pn different numbers smaller than n.
    % L3 is a vector containing exactly the other one.
    
    L = L1(L2,1);
    Xtr = X(L,:);
    Ytr = Y(L,:);
    % the proportion of (Xtr,Ytr) in (X,Y) is p.
    
    L = L1(L3,1);
    Xte = X(L,:);
    Yte = Y(L,:);
    % the proportion of (Xte,Yte) in (X,Y) is 1-p.
    
    erreur = 1 - asymetrique3(Xtr, Ytr, Xte, lambda, sigma,c)./Yte;
    
    erm = erm + mean(abs(erreur));
    % erm is the sum of the errors of all the predictions.
    prop = prop + (sum(erreur<0)/size(erreur,1));
    
end

erm = erm/nv;
% Finally, erm is the mean error of prediction.
prop = prop/nv;
resultat = [erm,prop];
