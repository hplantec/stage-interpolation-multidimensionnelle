
load datav3
load outliers_63
X(ol63,:) = [];
Y(ol63,:) = [];
H = X(:,3);
X = zscore(X(:,[2,4:8]));
Y = Y(:,4);

nv = 4;
nr = 1000;
p = 0.8;

tic; opt = optimizeif(X, H, Y, nv, nr, p); toc