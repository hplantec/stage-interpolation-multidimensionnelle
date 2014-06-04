
function[Yte] = pred(Xtr,Xte,Ytr,lambda,sigma)


Xtr1 = [ones(size(Xtr,1),1),Xtr];
Xte1 = [ones(size(Xte,1),1),Xte];
A = (Xtr1'*Xtr1)\(Xtr1'*Ytr);
Ztr = Ytr - Xtr1*A;

k=@(x,y) exp(-pdist2(x,y).^2/(2*sigma^2));
n = size(Xtr,1);
Ktrtr = k(Xtr,Xtr);
Ktetr = k(Xte,Xtr);
B = (Ktrtr + lambda*n*eye(n))\Ztr;
Yte = Xte1*A + Ktetr*B;




