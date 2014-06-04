

function[Yte] = asymetrique3(Xtr, Ytr, Xte, lambda, sigma,c)

Xtr1 = [Xtr,ones(size(Xtr,1),1)];
A = (Xtr1'*Xtr1)\(Xtr1'*Ytr);
Ztr = Ytr - Xtr1*A;

B = asymetrique(Xtr,Ztr,lambda,sigma,c);
k=@(x,y) exp(-pdist2(x,y).^2/(2*sigma^2));
K = k(Xte,Xtr);

Xte1 = [Xte,ones(size(Xte,1),1)];
Yte = K*B + Xte1*A;