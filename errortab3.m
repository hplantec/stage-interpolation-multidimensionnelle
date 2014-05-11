L = [95
    96
    98
    99
    100
    102
    120
    140
    147
    209
    470
    471
    488
    492
    519
    520
    610
    707
    730
    738
    772
    959
    1004
    1005
    1079
    1081
    1157
    1158
    1159
    1160
    1270
    1279
    1282
    1283
    1284
    1304
    1411
    1487
    1606
    1647
    1662
    1676
    1776
    1777
    1779
    1780
    1784
    1840
    1841
    1842
    1843
    1844
    1849
    1851
    1908
    1945
    1967
    1968
    1969
    2048
    2407
    2408
    2409
    2410
    2530
    2582
    2583
    2586
    2613];

load('datav3.mat')
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