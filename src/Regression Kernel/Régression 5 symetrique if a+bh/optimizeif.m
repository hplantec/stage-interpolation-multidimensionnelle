

function[opt] = optimizeif(X, H, Y, nv, nr, p)

ll = 2*rand(nr,1)+3;
sigma1 = 13*rand(nr,1)+2;
sigma2 = 10*rand(nr,1)+5;
sigma3 = 8*rand(nr,1)+6;

for i = 1 : nr
    erreur(i,:) = moyif(X, H, Y, 10^-ll(i), sigma1(i), sigma2(i), sigma3(i), nv, p);
    fprintf('%d%%\r', round(i/nr*100))
end

opt = [ll,sigma1,sigma2,sigma3,erreur];