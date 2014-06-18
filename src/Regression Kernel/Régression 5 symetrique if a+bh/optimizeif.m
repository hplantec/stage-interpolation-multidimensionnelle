

function[opt] = optimizeif(X, H, Y, nv, nr, p)

ll = 5*rand(nr,1)+8;
sigma1=6*rand(nr,1)+4;
%sigma1 pas en dessous de 3 c'est clair.
sigma2=15*rand(nr,1)+40;
sigma3=5*rand(nr,1)+10;


for i = 1 : nr   
    erreur(i,:) = moyif(X, H, Y, 10^-ll(i), sigma1(i), sigma2(i), sigma3(i), nv, p);
    fprintf('%d%%\r', round(i/nr*100))
end

opt = [ll,sigma1,sigma2,sigma3,erreur];