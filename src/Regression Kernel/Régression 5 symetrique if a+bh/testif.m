
load datav3
load outliers_63
X(ol63,:) = [];
Y(ol63,:) = [];
H = X(:,3);
X = zscore(X(:,[2,4:8]));
Y = Y(:,4);

nv = 4;
nr = 500;
p = 0.8;

tic; opt = optimizeif(X, H, Y, nv, nr, p); toc

% figure(1)
% scatter(opt(:,1),log(opt(:,5)));
% xlabel('-log(lambda)')
% ylabel('log(erreur 1)')
% 
% for i=2:4
% figure(i)
% scatter(opt(:,i),log(opt(:,5)))
% xlabel(['c ',num2str(i-1)])
% ylabel('log(erreur 1)')
% end

% % ll=4.48;
% % sigma1=-0.0348;
% % sigma2=3.2281;
% % sigma3=25.7547;
% % erreur1=1.04%;