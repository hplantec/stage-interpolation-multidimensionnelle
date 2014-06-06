
load datav3
load outliers_63
X(ol63,:) = [];
Y(ol63,:) = [];
H = X(:,3);
X = zscore(X(:,[2,4:8]));
Y = Y(:,4);

lambda = 10^-4.3767;
sigma1 = 1.8328;
sigma2 = 7.1967;
sigma3 = 8.8058;
nv = 10;
p = 0.8;

err = moy(X, H, Y, lambda, sigma1, sigma2, sigma3, nv, p)