
function[Yte] = predif2(Xtr,Htr,Ytr,Xte,Hte,lambda,sigma1,sigma2,sigma3)


% k1=@(x,y) exp(-pdist2(x,y).^2/(2*sigma1^2));

% Gaussian kernels:
% k2=@(x,y) exp(-pdist2(x,y).^2/(2*sigma2^2));
% k3=@(x,y) exp(-pdist2(x,y).^2/(2*sigma3^2));

% Monomial Kernels:
% k2=@(x,y) (x*y'+sigma2).^2;
% k3=@(x,y) (x*y'+sigma3).^2

% Matérn Kernels with nu=3/2:
% k2=@(x,y) (1+sqrt(3)*pdist2(x,y)/sigma2).*exp(-sqrt(3)*pdist2(x,y)/sigma2);
% k3=@(x,y) (1+sqrt(3)*pdist2(x,y)/sigma3).*exp(-sqrt(3)*pdist2(x,y)/sigma3);

% Matérn Kernels with nu=5/2:
k1=@(x,y) (1+sqrt(3)*pdist2(x,y)/sigma1+5*pdist2(x,y).^2/(3*sigma1^2)).*exp(-sqrt(5)*pdist2(x,y)/sigma1);
k2=@(x,y) (1+sqrt(3)*pdist2(x,y)/sigma2+5*pdist2(x,y).^2/(3*sigma2^2)).*exp(-sqrt(5)*pdist2(x,y)/sigma2);
k3=@(x,y) (1+sqrt(3)*pdist2(x,y)/sigma3+5*pdist2(x,y).^2/(3*sigma3^2)).*exp(-sqrt(5)*pdist2(x,y)/sigma3);

n = size(Xtr,1);

Ktrtr1 = k1(Xtr,Xtr);
Ktrtr2 = k2(Xtr,Xtr);
Ktrtr3 = k3(Xtr,Xtr);

Ktetr1 = k1(Xte,Xtr);
Ktetr2 = k2(Xte,Xtr);
Ktetr3 = k3(Xte,Xtr);

Htrp = 1/2*Htr+1/2*abs(Htr);
Htrm = 1/2*Htr-1/2*abs(Htr);
Htep = 1/2*Hte+1/2*abs(Hte);
Htem = 1/2*Hte-1/2*abs(Hte);

C = (Ktrtr1 + ((Htrp-70)*(Htrp-70)').*Ktrtr2 + ((Htrm-70)*(Htrm-70)').*Ktrtr3 + lambda*n*eye(n))\Ytr;
Yte = (Ktetr1 + ((Htep-70)*(Htrp-70)').*Ktetr2 + ((Htem-70)*(Htrm'-70)).*Ktetr3)*C;