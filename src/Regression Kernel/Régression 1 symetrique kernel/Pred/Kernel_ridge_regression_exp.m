function[Yte] = prederr(Xtr,Xte,Ytr,lambda,sigma)

k=@(x,y) exp(-pdist2(x,y).^2/(2*sigma^2));
n = size(Xtr,1);
Ktrtr = k(Xtr,Xtr);
Ktetr = k(Xte,Xtr);
A = (Ktrtr + lambda*n*eye(n))\Ytr;
Yte = Ktetr*A;