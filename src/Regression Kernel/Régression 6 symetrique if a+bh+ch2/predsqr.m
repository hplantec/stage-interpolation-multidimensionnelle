
function[Yte] = predsqr(Xtr,Htr,Ytr,Xte,Hte,lambda,sigma1,sigma2,sigma3,sigma4)


k1=@(x,y) exp(-pdist2(x,y).^2/(2*sigma1^2));
k2=@(x,y) exp(-pdist2(x,y).^2/(2*sigma2^2));
k3=@(x,y) exp(-pdist2(x,y).^2/(2*sigma3^2));
k4=@(x,y) exp(-pdist2(x,y).^2/(2*sigma4^2));

n = size(Xtr,1);

Ktrtr1 = k1(Xtr,Xtr);
Ktrtr2 = k2(Xtr,Xtr);
Ktrtr3 = k3(Xtr,Xtr);
Ktrtr4 = k4(Xtr,Xtr);

Ktetr1 = k1(Xte,Xtr);
Ktetr2 = k2(Xte,Xtr);
Ktetr3 = k3(Xte,Xtr);
Ktetr4 = k4(Xte,Xtr);

Htr = Htr-70;
Hte = Hte-70;
Htrp = 1/2*Htr+1/2*abs(Htr);
Htrm = 1/2*Htr-1/2*abs(Htr);
Htep = 1/2*Hte+1/2*abs(Hte);
Htem = 1/2*Hte-1/2*abs(Hte);
Htrp2 = Htrp.^2;
Htep2 = Htep.^2;

C = (Ktrtr1 + (Htrp*Htrp').*Ktrtr2 + (Htrm*Htrm').*Ktrtr3 + (Htrp2*Htrp2').*Ktrtr4 + lambda*n*eye(n))\Ytr;
Yte = (Ktetr1 + (Htep*Htrp').*Ktetr2 + (Htem*Htrm').*Ktetr3 + (Htep2*Htrp2').*Ktetr4)*C;