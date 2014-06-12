

function[opt] = optimizeif(X, H, Y, nv, nr, p)

ll = 3*rand(nr,1)+3.5;
% sigma1=0.3*rand(nr,1)-0.15;
% sigma2=100*rand(nr,1)-50;
% sigma3=100*rand(nr,1)-50;
sigma1=exp(4*rand(nr,1)+1);
sigma2=exp(4*rand(nr,1)+1);
sigma3=exp(4*rand(nr,1)+1);
% sigma3=50*rand(nr,1);

for i = 1 : nr   
    erreur(i,:) = moyif(X, H, Y, 10^-ll(i), sigma1(i), sigma2(i), sigma3(i), nv, p);
    fprintf('%d%%\r', round(i/nr*100))
end

opt = [ll,sigma1,sigma2,sigma3,erreur];