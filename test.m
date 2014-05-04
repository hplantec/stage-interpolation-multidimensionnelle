% lambda = 10^-14
% sigma = 2.8
clear all
load('datav3.mat')
best = optimize2(X,Y,10,0.05,1000)
best_lambda = 10^-best(2);
best_sigma = best(1);
moy(X,Y,best_lambda, best_sigma, 100 ,0.05)
% moy(X,Y, 10^-15.53, 2.139, 100 , 0.05) = 0.0808