%% A example of Kernel_ridge_regression : with k a kernel cstlinsqrcube_exp.
% mu is the weight of exp
% sigma^2 is the variance of the normal
% The blue curve is the trained one and red one is the forecast curve

function[] = Kernel_ridge_regression_cstlinsqrcubexp (Xtr , Ytr , Xte , lambda , sigma , mu , c, s, l , cst )

n=size(Xtr,1);
k=@(x,y) ((c*(x*y')+s).*(x*y')+l).*(x*y')+cst + mu*exp(-(x*ones(1,size(y,1))-ones(size(x,1),1)*y').^2/(2*sigma^2));

Ktrtr=k(Xtr,Xtr);
A=(Ktrtr+(lambda*n*eye(n)))\Ytr;
Ktetr=k(Xte,Xtr);
Yte=Ktetr*A;

scatter(Xtr,Ytr,30)
hold on
plot(Xte,Yte,'r')
hold off