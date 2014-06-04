%% A example of Kernel_ridge_regression_linexp on random value.

lambda = 0.001;
mu=1;
sigma=2;

Xtr=transpose(1:50) + 10*sort(rand(50,1));
Ytr=transpose(1:50) + 10*rand(50,1);
Xte=transpose(1 : 12000) / 100;

n=size(Xtr,1);

k=@(x,y) x*y' + mu*exp(-(x*ones(1,size(y,1))-ones(size(x,1),1)*y').^2/(2*sigma^2));

Ktrtr=k(Xtr,Xtr);
A=(Ktrtr+(lambda*n*eye(n)))\Ytr;
Ktetr=k(Xte,Xtr);
Yte=Ktetr*A;

scatter(Xtr,Ytr)
hold on
plot(Xte,Yte,'r')
hold off
