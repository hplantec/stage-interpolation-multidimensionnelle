

function[Yte] = prednew(Xtr,Htr,Ytr,Xte,Hte,lambda1,lambda2,sigma1,sigma2)


k1=@(x,y) exp(-pdist2(x,y).^2/(2*sigma1^2));
k2=@(x,y) exp(-pdist2(x,y).^2/(2*sigma2^2));
n = size(Xtr,1);
m = size(Xte,1);
Ktrtr1 = k1(Xtr,Xtr);
Ktrtr2 = k2(Xtr,Xtr);
Ktetr1 = k1(Xte,Xtr);
Ktetr2 = k2(Xte,Xtr);
Htrtr = Htr*Htr';
Htetr = Hte*Htr';
A = (Ktrtr1 + (lambda1/lambda2)*Htrtr.*Ktrtr2 + lambda1*n*eye(n))\Ytr;
Yte = (Ktetr1 + Htetr.*Ktetr2)*A;