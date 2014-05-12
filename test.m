
load('datav3.mat')
load 'outliers_63'
X = zscore(X);
X(L,:)=[];
Y(L,:)=[];

HP = optimize3(X,Y,32,0.8,1000)
