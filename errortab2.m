% This script returns a matrix. Each line contains a proportion of trained
% values, then the 3 errors L1, L2 and Linf for the datas of datav3.mat.

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
X(L,:) = [];
Y(L,:) = [];

for  i = 1 : 99
    erreur(i,:) = [i/100,moy(X,Y,1.5*10^-5, 1.37, 10 ,i/100)];
end

erreur

figure(1)
plot(erreur(:,2))
hold on
plot(erreur(:,3),'r')
hold off
legend('L1','L2')
xlabel('Proportion d apprentissage','fontsize',14)
ylabel('erreurs','fontsize',14)
title('erreurs de prédiction après suppression de 69 points','fontsize',14)
figure(2)
plot(erreur(:,4))
legend('Linf')
xlabel('Proportion d apprentissage','fontsize',14)
ylabel('erreurs','fontsize',14)
title('erreurs de prédiction après suppression de 69 points','fontsize',14)