

function[Yte] = predreg4(Xtr, Htr,  Ytr, Xte, Hte, lambda, sigma1, sigma2)


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

A = (Ktrtr1 + Htrtr.*Ktrtr2 + lambda*n*eye(n))\Ytr;
Yte = (Ktetr1 + Htetr.*Ktetr2)*A;