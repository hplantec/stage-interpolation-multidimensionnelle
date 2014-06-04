load datav3
load outliers_63
X = zscore(X(:,2:8));
Y = Y(:,4);
X(ol63,:)=[];
Y(ol63,:)=[];

nv = 10;
nr = 1000
p=0.8;

ll = 5*rand(nr,1)+4;
sigma = 4*rand(nr,1)+0.5;
c = (45*rand(nr,1)+5) *10^-4;

for i = 1 : nr
    resultat(i,:) = asymetrique_cross(X, Y, 10^-ll(i) , sigma(i), c(i), nv, p)
    fprintf(%d%%\r, i/nr*100)
end

opt = [ll,sigma,c,resultat];
    
figure(j)
scatter(opt(:,4),opt(:,5))
xlabel('erreur')
ylabel('proportion de points de au-dessus')
title(['Compromis à p=',num2str(p)])

    
    