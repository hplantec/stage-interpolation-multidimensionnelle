
load datav3
load outliers_63
X(ol63,:) = [];
Y(ol63,:) = [];
H = X(:,3);
X = zscore(X(:,[2,4:8]));
Y = Y(:,4);

nv = 4;
nr = 10;
p = 0.8;

tic; opt = optimizeif(X, H, Y, nv, nr, p); toc

figure(1)
scatter(opt(:,1),log(opt(:,2)))
xlabel('sigma 3')
ylabel('log(erreur 1)')

[~,a]=min(opt(:,2));
opt(a,1)
opt(a,2:4)

% % avec p=0.8
% % sigma=5.4487e+03;
% % erreur1=0.89%;
% % erreur2=2.38%;
% % erreursup=32.63%;