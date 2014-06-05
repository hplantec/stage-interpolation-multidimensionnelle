

function[Yte] = pred(Xtr,Htr,Ytr,Xte,Hte,lambda,sigma1,sigma2,sigma3)


k1=@(x,y) exp(-pdist2(x,y).^2/(2*sigma1^2));
k2=@(x,y) exp(-pdist2(x,y).^2/(2*sigma2^2));
k3=@(x,y) exp(-pdist2(x,y).^2/(2*sigma3^2));

n = size(Xtr,1);

Ktrtr1 = k1(Xtr,Xtr);
Ktrtr2 = k2(Xtr,Xtr);
Ktrtr3 = k3(Xtr,Xtr);

Ktetr1 = k1(Xte,Xtr);
Ktetr2 = k2(Xte,Xtr);
Ktetr3 = k3(Xte,Xtr);

C = (Ktrtr1 + (Htr*Htr').*Ktrtr2 + abs(Htr*Htr').*Ktrtr3 + lambda*n*eye(n))\Ytr;
Yte = (Ktetr1 + (Hte*Htr').*Ktetr2 + abs(Hte*Htr').*Ktetr3)*C;