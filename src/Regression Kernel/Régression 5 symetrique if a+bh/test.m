
load datav3
load outliers_63
H = X(:,3);
X = zscore(X(:,[2,4:8]));
Y = Y(:,4);

nv = 10;
nr = 100;
p = 0.8;

tic; opt = optimize(X, H, Y, nv, nr, p); toc