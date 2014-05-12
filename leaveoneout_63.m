
load 'outliers_63'
load('datav3.mat')

X1 = zscore(X(: , 2 : 8));
Y1 = Y(:,4);
n = size(Y1,1);
sigma = % 1.37;
lambda = % 1.5*10^-5;

for i = 1 : n
    Li = unique([L;i]);
    Xtr = X1;
    Xte = Xtr(i,:);
    Xtr(Li,:) = [];
    Ytr = Y1;
    Ytr(Li,:) = [];
    Yte = pred(Xtr,Xte,Ytr,lambda,sigma);
    A(i,:) = [Y1(i,1),Yte(1,1)];
end

scatter(A(:,1) , A(:,2))
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    