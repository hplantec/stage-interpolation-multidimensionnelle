function[err] = Kernel_ridge_regression_linexp_parameters (X , Y , lambda , sigma , mu , nv , p)

k = @(x,y) x*y + mu*exp(-(x-y)^2/(2*sigma^2));
n = size(X,1); pn = floor(p*n);
Ktrtr = zeros(pn,pn);
Ktetr = zeros(n-pn,pn);
erreur = zeros(nv,1);
s = 0;

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
    
    for i = 1 : pn
        for j = 1 : pn
            Ktrtr(i,j) = k(Xtr(i),Xtr(j));
        end
    end
    A = (Ktrtr+(lambda*pn*eye(pn)))\Ytr;
    for i = 1 : (n-pn)
        for j = 1 : pn
            Ktetr(i,j) = k(Xte(i),Xtr(j));
        end
    end
    erreuri = Yte-Ktetr*A;
    erreur(i) = mean(erreuri.*erreuri);
end

err = mean(erreur);