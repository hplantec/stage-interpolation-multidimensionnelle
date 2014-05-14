

function[Yte] = final(Xte)

load('datav3.mat')
load('outliers_63.mat')
X(ol63,:)=[];
Y(ol63,:)=[];
[Xtr,Xmu,Xsigma] = zscore(X(:,2:8)); %X(:,2:8) = Xsigma.*Xtr + Xmu
Ytr = Y(:,4);
lambda = 10^-4.7147; %?
sigma = 1.6707; %?
% min abs : 0.0186
% argmin abs : [1.6707    4.7147]
% 
% min rmse : 0.0338
% argmin rmse : [2.1937    5.2347]
% 
% min sup : 0.3098
% argmin sup :  [0.4054    3.1793]

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