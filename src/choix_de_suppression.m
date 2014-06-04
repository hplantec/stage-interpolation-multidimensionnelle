
clear all
load('datav3.mat')

L1 = X(:,2)==2 & X(:,4)==1 & X(:,5)==0 & X(:,6)==1 & X(:,7)==0 & X(:,8)==735508;
L2 = X(:,2)==4 & X(:,4)==1 & X(:,5)==0 & X(:,6)==1 & X(:,7)==0 & X(:,8)==735508;
L3 = X(:,2)==2 & X(:,4)==2 & X(:,5)==0 & X(:,6)==1 & X(:,7)==0 & X(:,8)==735508;
L4 = X(:,2)==2 & X(:,4)==5 & X(:,5)==0 & X(:,6)==1 & X(:,7)==0 & X(:,8)==735508;
L5 = X(:,2)==4 & X(:,4)==5 & X(:,5)==0 & X(:,6)==1 & X(:,7)==0 & X(:,8)==735508;
L6 = X(:,2)==2 & X(:,4)==10 & X(:,5)==0 & X(:,6)==1 & X(:,7)==0 & X(:,8)==735508;
L7 = X(:,2)==4 & X(:,4)==1 & X(:,5)==0 & X(:,6)==1 & X(:,7)==0 & X(:,8)==736126;
L8 = X(:,2)==4 & X(:,4)==1 & X(:,5)==0 & X(:,6)==1 & X(:,7)==0 & X(:,8)==735901;
L9 = X(:,2)==4 & X(:,4)==10 & X(:,5)==0 & X(:,6)==0 & X(:,7)==1 & X(:,8)==735508;
H = [22;31;13;21;44.5;40;38;75;35.592];
M = [find(L1 & X(:,3)==H(1))
    find(L2 & X(:,3)==H(2))
    find(L3 & X(:,3)==H(3))
    find(L4 & X(:,3)==H(4))
    find(L5 & X(:,3)==H(5))
    find(L6 & X(:,3)==H(6))
    find(L7 & X(:,3)==H(7))
    find(L8 & X(:,3)==H(8))
    find(L9 & X(:,3)==H(9))];

L = X(:,3)>70 | X(:,4)>50;
L = unique([find(L);M]);

Xtr = X(:,2:8);
Xtr(L,:)=[];
Xtei = X(L,2:8);

Ytr = Y(:,4);
Ytr(L,:)=[];
Ytei = Y(L,4);

lambda = 1.5*10^-5;
sigma = 1.37;


for  i = 1 : 75
    Xte = Xtei(i,:);
    Yte = Ytei(i,:);
    erreur(i,:) = errorm(Xtr, Ytr, Xte, Yte, lambda, sigma);
end

erreur = erreur(:,1);

L = L((erreur>0.04),1);

Xtr = X(:,2:8);
Xtr(L,:)=[];
Xtei = X(L,2:8);

Ytr = Y(:,4);
Ytr(L,:)=[];
Ytei = Y(L,4);

lambda = 1.5*10^-5;
sigma = 1.37;


for  i = 1 : size(Xtei,1)
    Xte = Xtei(i,:);
    Yte = Ytei(i,:);
    erreur2(i,:) = errorm(Xtr, Ytr, Xte, Yte, lambda, sigma);
end

erreur2 = erreur2(:,1);

L = L((erreur2>0.04),1);

Xtr = X(:,2:8);
Xtr(L,:)=[];
Xtei = X(L,2:8);

Ytr = Y(:,4);
Ytr(L,:)=[];
Ytei = Y(L,4);

lambda = 1.5*10^-5;
sigma = 1.37;

for  i = 1 : size(Xtei,1)
    Xte = Xtei(i,:);
    Yte = Ytei(i,:);
    erreur3(i,:) = errorm(Xtr, Ytr, Xte, Yte, lambda, sigma);
end

erreur3 = erreur3(:,1);

L = L(erreur3>0.08,1)