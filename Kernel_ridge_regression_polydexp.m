%% this function applies a polynomial regression on training datas and then a polynomial ridge regression to improve the regression.
% the first argument is Xtr
% the second argument is Ytr
% the third argument is Xte
% the forth argument is lambda, the smoothness coefficient
% the fifth argument is sigma
% the sixth argument is d, the degree of the polynome

function[] = Kernel_ridge_regression_polydexp (Xtr , Ytr , Xte , lambda , sigma , d)

n=size(Xtr,1);
P = exp(log(Xtr)*[0 : d]);
A = (P'*P)\P'*Ytr;
Ztr = Ytr - P*A;

k=@(x,y) exp(-(x*ones(1,size(y,1))-ones(size(x,1),1)*y').^2/(2*sigma^2));

Ktrtr=k(Xtr,Xtr);
C=(Ktrtr+(lambda*n*eye(n)))\Ztr;
Ktetr=k(Xte,Xtr);
Q = exp(log(Xte)*[0 : d]);

Yte=Q*A + Ktetr*C;

scatter(Xtr,Ytr)
hold on
plot(Xte,Yte,'r')
hold off