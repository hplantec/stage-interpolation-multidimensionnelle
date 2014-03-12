clear all
figure(3);
clf
figure(2);
clf
figure(1);
clf

load data.mat;

%Il faut placer le ficher des données dans le même dossier que le script avant de lancer ce dernier.
%Première approche des données fournies par TDF

%L'histogramme des prix des différentes années (Nombres d'antennes par
%tranche de prix

figure(1);
subplot(3,2,1);
hist(Y(:,1),100);
subplot(3,2,2);
hist(Y(:,2),100);
subplot(3,2,3);
hist(Y(:,3),100);
subplot(3,2,4);
hist(Y(:,4),100);
%Regardons aussi l'évolution temporelle du prix, en fait la différence du
%prix de l'année 2015 et 2012. Toujours sous forme d'histogramme
subplot(3,2,5);
hist(Y(:,4)-Y(:,1),100);

%Maintenant on s'intéresse à la corrélation entre les entrées et le prix de
%sortie. On ne prendra que le prix de 2012 car on a vu que les prix
%obéissaient en général à une dépendance similaires.
figure(2);

for i=1:5
    subplot(3,2,i);
    scatter(X(:,i),Y(:,1));
end

%On voit qu'il y a une corrélation intéressante entre le critère 3 (ie la
%hauteur de l'antenne) et le prix. A l'inverse le critère RC ou RP (critère
%5 codé en 1 -1 0 si pas de donnée) n'a pas l'air très pertinent.

%Problème: on a des points qui explosent et ne semblent pas suivre la même
%loi, on va donc dans un premier temps les couper. Coupons par exemple ceux
%qui coûtent plus de 2000 euros).

L=Y(:,1)<2000;


%Le seul critère 3 ne suffit pas, on voit des écarts importants pour de
%mêmes valeurs de hauteurs. on peut donc tracer des diagrammes avec
%plusieurs critères (ici 3) et le prix avec une échelle de couleur.

figure(3);
scatter3(X(L,1),X(L,4),X(L,3),50,log(Y(L,1)),'filled');

%On observe toujours la dépendance en la hauteur (qui donne la graduation
%de couleur selon l'axe des Z). SAUF en deux points (le point bleu et le
%vert clair isolés en hauteur) donc il faut déterminer (à priori à la
%réunon avec le contact de TDF) si ces sites sont déterminants parce qu'ils
%possèdent un autre critère ou si ce sont des exceptions (ex antenne
%interne à une entreprise, ou postées en un point géographique très
%intéressant etc...). Auquel cas, il faut trouver une autre méthode pour
%extraire les points marginaux, car la troncature ne suffit pas.

