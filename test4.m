load datav3
load outliers_63
X = zscore(X(:,2:8));
Y = Y(:,4);
X(ol63,:)=[];
Y(ol63,:)=[];

nv = 100;

ll = 5*rand(100,1)+4;
sigma = 4*rand(100,1)+0.5;
c = (45*rand(100,1)+5) *10^-4;

p = 0.8;
    
    for i=1:100
        resultat(i,:) = asymetrique_cross(X, Y, 10^-ll(i) , sigma(i), c(i), nv, p)
    end

opt = [ll,sigma,c,resultat];