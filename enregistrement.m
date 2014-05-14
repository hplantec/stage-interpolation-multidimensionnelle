

load('datav3.mat')
load('outliers_63.mat')

X(ol63,:)=[];
Y(ol63,:)=[];
[Xtr,Xmu,Xsigma] = zscore(X(:,2:8)); %X(:,2:8) = Xsigma.*Xtr + Xmu
Ytr = Y(:,4);
lambda = 10^-4.7147;
sigma = 1.6707;
Xtr1 = [ones(size(Xtr,1),1),Xtr];
A = (Xtr1'*Xtr1)\(Xtr1'*Ytr);
Ztr = Ytr - Xtr1*A;
n = size(Xtr,1);
k=@(x,y) exp(-pdist2(x,y).^2/(2*sigma^2));
Ktrtr = k(Xtr,Xtr);
B = (Ktrtr + lambda*n*eye(n))\Ztr;

save('finalvect','Xtr','Xmu','Xsigma','sigma','A','B')

% Il ne reste donc plus qu'à faire:
% 
% function[Yte] = final(Xte)
% load 'finalvect';
% Xte = (Xte-(ones(size(Xte,1),1)*Xmu))./(ones(size(Xte,1),1)*Xsigma);
% Xte1 = [ones(size(Xte,1),1),Xte];
% k=@(x,y) exp(-pdist2(x,y).^2/(2*sigma^2));
% Ktetr = k(Xte,Xtr);
% Yte = Xte1*A + Ktetr*B;