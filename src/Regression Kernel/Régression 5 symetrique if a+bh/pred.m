

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

C = (Ktrtr1 + ((Htr-70)*(Htr-70)').*Ktrtr2 + abs((Htr-70)*(Htr-70)').*Ktrtr3 + lambda*n*eye(n))\Ytr;
Yte = (Ktetr1 + ((Hte-70)*(Htr-70)').*Ktetr2 + abs((Hte-70)*(Htr'-70)).*Ktetr3)*C;