%% This fonction return the mean square_error of data inputs using Kernel_ridge_regression_cubexp
% The inputs of this function are X , Y , the coef of the smoothness lambda
% , the standard deviation sigma , the weight of exp mu , and then the
% number of data sets on which this function calculate the mean error nv
% and the proportion p of trained elements out of all the elements

function[err] = Kernel_ridge_regression_cubexp_parameters (X , Y , lambda , sigma , mu , nv , p)

k=@(x,y) (x*y').^3 + mu*exp(-(x*ones(1,size(y,1))-ones(size(x,1),1)*y').^2/(2*sigma^2));
n = size(X,1); pn = floor(p*n);
erreur = zeros(nv,1);

 for s = 1 : nv
    [Xtr,Xte,Ytr,Yte]=split(X,Y,0.9);
    
    Ktrtr=k(Xtr,Xtr);
    A=(Ktrtr+(lambda*pn*eye(pn)))\Ytr;
    Ktetr=k(Xte,Xtr);
    erreuri = Yte-Ktetr*A;
    erreur(s) = mean(erreuri.*erreuri);
end

err = mean(erreur);