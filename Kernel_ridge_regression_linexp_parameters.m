%% This fonction return the mean square_error of data inputs
% The inputs of this function are X , Y , the coef of the smoothness lambda
% , the standard deviation sigma , the weight of exp mu , and then the
% number of data sets on which this function calculate the mean error nv
% and the proportion p of trained elements out of all the elements

function[err] = Kernel_ridge_regression_linexp_parameters (X , Y , lambda , sigma , mu , nv , p)

k=@(x,y) x*y' + mu*exp(-(x*ones(1,size(y,1))-ones(size(x,1),1)*y').^2/(2*sigma^2));
n = size(X,1); pn = floor(p*n);
erreur = zeros(nv,1);

for s = 1 : nv
    L1 = transpose(randperm(n));
    L2 = transpose(1 : pn);
    L3 = transpose(pn+1 : n);
    L = L1(L2,1);
    Xtr = X(L,1);
    Ytr = Y(L,1);
    L = L1(L3,1);
    Xte = X(L,1);
    Yte = Y(L,1);
    
    Ktrtr=k(Xtr,Xtr);
    A=(Ktrtr+(lambda*pn*eye(pn)))\Ytr;
    Ktetr=k(Xte,Xtr);
    erreuri = Yte-Ktetr*A;
    erreur(s) = mean(erreuri.*erreuri);
end

err = mean(erreur);