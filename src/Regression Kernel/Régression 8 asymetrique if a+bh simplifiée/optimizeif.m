

function[opt] = optimizeif(X, H, Y, nv, nr, p)

ll=9*rand(nr,1)+1;
sigma3=10*rand(nr,1)+10^4;


for i = 1 : nr   
    erreur(i,:) = moyif(X, H, Y, sigma3(i), nv, p);
    fprintf('%d%%\r', round(i/nr*100))
end

opt = [sigma3,erreur];