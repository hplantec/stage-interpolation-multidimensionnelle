% This script returns a matrix. Each line contains a proportion of trained
% values, then the 3 errors L1, L2 and Linf for the datas of datav3.mat.

clear all
load('datav3.mat')

for  i = 1 : 100
    erreur(i,:) = [i/100,moy(X,Y,1.5*10^-5, 1.37, 10 ,i/100)];
end

erreur