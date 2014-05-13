

function[Yte] = prednew(Xtr,Htr,Ytr,Xte,Hte,lambda,sigma)


k=@(x,y) exp(-pdist2(x,y).^2/(2*sigma^2));
n = size(Xtr,1);
m = size(Xte,1);
Ktrtr = k(Xtr,Xtr);
Ktetr = k(Xte,Xtr);
Htrtr = Htr*Htr' + ones(n);
Htetr = Hte*Htr' + ones(m,n);
A = (Htrtr.*Ktrtr + lambda*n*eye(n))\Ytr;
Yte = (Htetr.*Ktetr)*A;