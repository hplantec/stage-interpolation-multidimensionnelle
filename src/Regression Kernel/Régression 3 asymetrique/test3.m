load datav3
load outliers_63
X = zscore(X(:,2:8));
Y = Y(:,4);
X(ol63,:)=[];
Y(ol63,:)=[];

nv = 10;

ll = 5*rand(100,1)+4;
sigma = 4*rand(100,1)+0.5;
c = (45*rand(100,1)+5) *10^-4;
opt = [ll,sigma,c];

for j = 1 : 3
    p = 0.6+j/10;
    
    for i = 1 : 100
        resultat(i,:) = asymetrique_cross(X, Y, 10^-ll(i) , sigma(i), c(i), nv, p)
        i
    end

    opt = [opt,resultat];
    
    figure(j)
    scatter(resultat(:,1),resultat(:,2))
    xlabel('erreur')
    ylabel('proportion de points de au-dessus')
    title(['Compromis à p=',num2str(p)])
    
end
