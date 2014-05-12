
load 'outliers_63'
load('datav3.mat')
X(ol63,:) = [];
Y(ol63,:) = [];

for  i = 1 : 99
    erreur(i,:) = [i/100,moy(X,Y,lambda, sigma, 10 ,i/100)];
end


figure(1)
plot(erreur(:,2),'b')
hold on
plot(erreur(:,3),'r')
hold off
legend('L1','L2')
xlabel('Proportion d apprentissage','fontsize',14)
ylabel('erreurs','fontsize',14)
title('erreurs de prédiction après suppression de 63 points','fontsize',14)
figure(2)
plot(erreur(:,4))
legend('Linf')
xlabel('Proportion d apprentissage','fontsize',14)
ylabel('erreurs','fontsize',14)
title('erreurs de prédiction après suppression de 63 points','fontsize',14)