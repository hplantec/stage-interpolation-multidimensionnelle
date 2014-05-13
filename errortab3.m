
load 'outliers_63'
load('datav3.mat')
X(ol63,:) = [];
Y(ol63,:) = [];
H = zscore(X(:,3));
X = zscore(X(:,[2,4:8]));
Y = Y(:,4);

for  i = 1 : 99
    erreur(i,:) = moy2(X, H, Y, %lambda = ? 3.7*10^-5, sigma = ? 5.5, 32 ,i/100);
end


figure(1)
plot(erreur(:,1),'b')
hold on
plot(erreur(:,2),'r')
hold off
legend('L1','L2')
xlabel('Proportion d apprentissage','fontsize',14)
ylabel('erreurs','fontsize',14)
title('erreurs de prédiction après suppression de 63 points','fontsize',14)
figure(2)
plot(erreur(:,3))
legend('Linf')
xlabel('Proportion d apprentissage','fontsize',14)
ylabel('erreurs','fontsize',14)
title('erreurs de prédiction après suppression de 63 points','fontsize',14)
plot(erreur(:,4))
legend('L2 absolue')
xlabel('Proportion d apprentissage','fontsize',14)
ylabel('erreurs','fontsize',14)
title('erreurs de prédiction après suppression de 63 points','fontsize',14)