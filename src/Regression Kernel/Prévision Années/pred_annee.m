



function[Yte2015] = pred_annee(Xtr,Ytr2014,Ytr2015,Xte,lambda,sigma)


Xtr1 = [ones(size(Xtr,1),1),Xtr];
Xte1 = [ones(size(Xte,1),1),Xte];
A = (Xtr1'*Xtr1)\(Xtr1'*Ytr2014);
Ztr = Ytr2014 - Xtr1*A;

k=@(x,y) exp(-pdist2(x,y).^2/(2*sigma^2));
n = size(Xtr,1);
Ktrtr = k(Xtr,Xtr);
Ktetr = k(Xte,Xtr);
B = (Ktrtr + lambda*n*eye(n))\Ztr;
Yte2014 = Xte1*A + Ktetr*B;

Ytr1 = [ones(size(Xtr,1),1),Ytr2014];
A = (Ytr1'*Ytr1)\(Ytr1'*Ytr2015);
Yte1 = [ones(size(Xte,1),1),Yte2014];
Yte2015 = Yte1*A;