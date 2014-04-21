% lambda = 10^-15.53
% sigma = 2.139
clear all
load('datav3.mat')
tic; best = optimize(X,Y,10,0.05); toc;
best_lambda = 10^-best(2);
best_sigma = best(1);
moy(X,Y,best_lambda, best_sigma, 100 ,0.05)
% moy(X,Y, 10^-15.53, 2.139, 100 , 0.05) = 0.0808