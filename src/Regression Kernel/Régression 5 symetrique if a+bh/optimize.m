

function[opt] = optimize(X, H, Y, nv, nr, p)

ll = 7*rand(nr,1)+3;
sigma1 = 5*rand(nr,1)+1;
sigma2 = 5*rand(nr,1)+1;
sigma3 = 5*rand(nr,1)+1;

for i = 1 : nr
    erreur(i,:) = moy(X, H, Y, 10^-ll(i), sigma1(i), sigma2(i), sigma3(i), nv, p);
    fprintf('%d%%\r', i/nr*100)
end

opt = [ll,sigma1,sigma2,sigma3,erreur];