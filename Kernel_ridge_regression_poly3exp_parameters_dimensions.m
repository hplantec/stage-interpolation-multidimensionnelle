%% This fonction return the mean square_error of data inputs using Kernel_ridge_regression_poly3exp
% The inputs of this function are X , Y , the coef of the smoothness lambda
% , the standard deviation sigma , the weight of the polynome l s c , and then the
% number of data sets on which this function calculate the mean error nv
% and the proportion p of trained elements out of all the elements


function[err] = Kernel_ridge_regression_poly3exp_parameters_dimensions(X , Y , lambda , sigma , l , s , c , nv , p)

k=@(x,y) l*(x*y') + s*(x(:,3)*y(:,3)').^2 + c*(x(:,3)*y(:,3)').^3 + exp(-pdist2(x,y)/(2*sigma^2));
n = size(X,1); pn = floor(p*n);
erreur = zeros(nv,1);

for s = 1 : nv
    L1 = transpose(randperm(n));
    L2 = transpose(1 : pn);
    L3 = transpose(pn+1 : n);
    L = L1(L2,1);
    Xtr = X(L,:);
    Ytr = Y(L,4);
    L = L1(L3,1);
    Xte = X(L,:);
    Yte = Y(L,4);
    
    Ktrtr=k(Xtr,Xtr);
    A=(Ktrtr+(lambda*pn*eye(pn)))\Ytr;
    Ktetr=k(Xte,Xtr);
    erreuri = Yte-Ktetr*A;
    erreur(s) = mean(erreuri.*erreuri);
end

err = mean(erreur);