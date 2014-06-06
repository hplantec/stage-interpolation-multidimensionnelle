

load datav3
load outliers_63
n = 1201;
X(ol63,:)=[];
Y(ol63,:)=[];
Htr= X(:,3);
Xtr = zscore(X(:,[2,4:8]));
Ytr = Y(:,4);
Xte = ones(n,1)*[-0.5746,-0.0958,-0.1323,0.2584,-0.6540,0.2];
Hte = linspace(0,120,n)';
lambda = 10^-4.3767;
sigma1 = 1.8328;
sigma2 = 7.1967;
sigma3 = 8.8058;

Yte = predif(Xtr,Htr,Ytr,Xte,Hte,lambda,sigma1,sigma2,sigma3);
plot(Hte,Yte)
%%
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

C = (Ktrtr1 + ((Htr-70)*(Htr-70)').*Ktrtr2 + lambda*n*eye(n))\Ytr;
Yte = (Ktetr1 + ((Hte-70)*(Htr-70)').*Ktetr2)*C;

hold on
plot(Hte,Yte,'r')
hold off