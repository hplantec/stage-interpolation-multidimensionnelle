
load('datav3.mat')
load 'outliers_63'
X(ol63,:)=[];
Y(ol63,:)=[];
X = zscore(X(:,2:8));
H = X(:,2);
X(:,2) = [];
Y = Y(:,4);

p=0.8;
nv=4;
np=1000;
tic; HP = optimizereg4(X, H ,Y,nv,p,np); toc;

XLABEL={'sigma1','sigma2','-log(lambda1)'};
for i=1:3
figure(i)
scatter(HP(:,i),log(HP(:,5)));
title('erreur absolue pour la régression affine');
ylabel('log(erreur absolue)');
xlabel(XLABEL{i});
end


HP(find(HP(:,5)==min(HP(:,5))),:)