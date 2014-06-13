
function[Yte] = predif2(Xtr, Htr, Ytr, Xte, Hte, sigma3)



% Kernel hammer:
% k3=@(x,y) 0.9998*ones(size(pdist2(x,y)));

% Gaussian kernel:
% k3=@(x,y) exp(-pdist2(x,y).^2/(2*sigma3^2));

% Monomial Kernel:
% k3=@(x,y) (x*y'+sigma3).^2;

% Matérn Kernel with nu=3/2:
% k3=@(x,y) (1+sqrt(3)*pdist2(x,y)/sigma3).*exp(-sqrt(3)*pdist2(x,y)/sigma3);

% Matérn Kernel with nu=5/2:
% k3=@(x,y) (1+sqrt(3)*pdist2(x,y)/sigma3+5*pdist2(x,y).^2/(3*sigma3^2)).*exp(-sqrt(5)*pdist2(x,y)/sigma3);

%Simplified Matérn Kernel with nu=5/2:
k3=@(x,y) exp(-sqrt(5)*pdist2(x,y)/sigma3);

n = size(Xtr,1);

Ktrtr3 = k3(Xtr,Xtr);

Ktetr3 = k3(Xte,Xtr);

Htrp=Htr;
Htep=Hte;

C = ((Htrp*Htrp').*Ktrtr3 + 10^8*Ktrtr3 + 0.00001*n*eye(n))\Ytr; 
%on a pris une valeur arbitraire de lambda à 10^-5 qui semble donner de bons résultats... Pourquoi? Aucune idée.

Yte = ((Htep*Htrp').*Ktetr3 + 10^8*Ktetr3)*C;



