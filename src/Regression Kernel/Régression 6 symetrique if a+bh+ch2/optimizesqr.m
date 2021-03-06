

function[opt] = optimizesqr(X, H, Y, nv, nr, p)

% ll = 6*rand(nr,1)+4;
% sigma1 = 10*rand(nr,1)+0.2;
% sigma2 = 50*rand(nr,1);
% sigma3 = 45*rand(nr,1)+5;
% sigma4 = 50*rand(nr,1);
ll = 3*rand(nr,1)+5;
sigma1 = 50*rand(nr,1);
sigma2 = 20*rand(nr,1)+30;
sigma3 = 15*rand(nr,1)+10;
sigma4 = rand(nr,1);

for i = 1 : nr
    erreur(i,:) = moysqr(X, H, Y, 10^-ll(i), sigma1(i), sigma2(i), sigma3(i), sigma4(i), nv, p);
    fprintf('%d%%\r', round(i/nr*100))
end

opt = [ll,sigma1,sigma2,sigma3,sigma4,erreur];