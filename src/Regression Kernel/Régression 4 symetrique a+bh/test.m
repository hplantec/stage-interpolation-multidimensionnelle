
load('datav3.mat')
load 'outliers_63'
X(ol63,:)=[];
Y(ol63,:)=[];
X = zscore(X(:,2:8));
H = X(:,2);
X(:,2) = [];
Y = Y(:,4);

HP = optimize3(X, H ,Y,32,0.8,1000)