

function[opt] = optimizeif(X, H, Y, nv, nr, p)

ll = 4*rand(nr,1)+1;
sigma1 = 20*rand(nr,1)+1;
sigma2 = 20*rand(nr,1)+1;
sigma3 = 20*rand(nr,1)+1;

for i = 1 : nr
    erreur(i,:) = moyif(X, H, Y, 10^-ll(i), sigma1(i), sigma2(i), sigma3(i), nv, p);
    fprintf('%d%%\r', round(i/nr*100))
end

opt = [ll,sigma1,sigma2,sigma3,erreur];