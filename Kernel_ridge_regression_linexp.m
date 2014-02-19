%% A example of Kernel_ridge_regression : with k a kernel lin_exp.
% mu is the weight of exp
% sigma^2 is the variance of the normal

lambda = 0.001;
mu=10;
sigma=3;

Xtr=columnA;
Ytr=columnB;
Xte=transpose(735595 : 735650);
k=@(x,y) x*y + mu*exp(-(x-y)^2/(2*sigma^2));
n=size(Xtr,1);
Ktrtr=rand(n,n);
for i = 1 : n
    for j = 1 : n
        Ktrtr(i,j)=k(Xtr(i),Xtr(j));
    end
end
A= (Ktrtr+(lambda*n*eye(n)))\Ytr;
m=size(Xte,1);
Ktetr=rand(m,n);
for i = 1 : m
    for j = 1 : n
        Ktetr(i,j)=k(Xte(i),Xtr(j));
    end
end
Yte=Ktetr*A;
plot(Xtr,Ytr)
hold on
plot(Xte,Yte,'r')
hold off