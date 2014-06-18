
load datav3
% load outliers_63
% X(ol63,:) = [];
% Y(ol63,:) = [];
H = X(:,3);
X = zscore(X(:,[2,4:8]));
Y = Y(:,4);

nv = 4;
nr = 100;
p = 0.8;

tic; opt = optimizesqr(X, H, Y, nv, nr, p); toc

figure(1)
scatter(opt(:,1),log(opt(:,6)));
xlabel('-log(lambda)')
ylabel('log(erreur 1)')

for i=2:5
figure(i)
scatter(opt(:,i),log(opt(:,6)))
xlabel(['sigma ',num2str(i-1)])
ylabel('log(erreur 1)')
end

[~,a]=min(opt(:,6));
opt(a,6)
opt(a,:)