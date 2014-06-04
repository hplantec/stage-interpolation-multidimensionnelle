%% Kernel_ridge_regression(Xtr,Ytr,Xte,k,lambda) renvoie les images de Xte par la fonction f minimisant l'�cart entre Ytr et f(Xtr), control� par lambda fois sa norme d�finit dans le RKHS li� � k

function[Yte]= Kernel_ridge_regression(Xtr,Ytr,Xte,k,lambda)

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