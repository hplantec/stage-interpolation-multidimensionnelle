clear all
figure(3);
clf
figure(2);
clf
figure(1);
clf

load data.mat;

%Il faut placer le ficher des donn�es dans le m�me dossier que le script avant de lancer ce dernier.
%Premi�re approche des donn�es fournies par TDF

%L'histogramme des prix des diff�rentes ann�es (Nombres d'antennes par
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
%Regardons aussi l'�volution temporelle du prix, en fait la diff�rence du
%prix de l'ann�e 2015 et 2012. Toujours sous forme d'histogramme
subplot(3,2,5);
hist(Y(:,4)-Y(:,1),100);

%Maintenant on s'int�resse � la corr�lation entre les entr�es et le prix de
%sortie. On ne prendra que le prix de 2012 car on a vu que les prix
%ob�issaient en g�n�ral � une d�pendance similaires.
figure(2);

for i=1:5
    subplot(3,2,i);
    scatter(X(:,i),Y(:,1));
end

%On voit qu'il y a une corr�lation int�ressante entre le crit�re 3 (ie la
%hauteur de l'antenne) et le prix. A l'inverse le crit�re RC ou RP (crit�re
%5 cod� en 1 -1 0 si pas de donn�e) n'a pas l'air tr�s pertinent.

%Probl�me: on a des points qui explosent et ne semblent pas suivre la m�me
%loi, on va donc dans un premier temps les couper. Coupons par exemple ceux
%qui co�tent plus de 2000 euros).

L=Y(:,1)<2000;


%Le seul crit�re 3 ne suffit pas, on voit des �carts importants pour de
%m�mes valeurs de hauteurs. on peut donc tracer des diagrammes avec
%plusieurs crit�res (ici 3) et le prix avec une �chelle de couleur.

figure(3);
scatter3(X(L,1),X(L,4),X(L,3),50,log(Y(L,1)),'filled');

%On observe toujours la d�pendance en la hauteur (qui donne la graduation
%de couleur selon l'axe des Z). SAUF en deux points (le point bleu et le
%vert clair isol�s en hauteur) donc il faut d�terminer (� priori � la
%r�unon avec le contact de TDF) si ces sites sont d�terminants parce qu'ils
%poss�dent un autre crit�re ou si ce sont des exceptions (ex antenne
%interne � une entreprise, ou post�es en un point g�ographique tr�s
%int�ressant etc...). Auquel cas, il faut trouver une autre m�thode pour
%extraire les points marginaux, car la troncature ne suffit pas.

