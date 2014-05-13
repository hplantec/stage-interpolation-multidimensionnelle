
load 'outliers_63'
load('datav3.mat')

H1 = zscore(X(:,3));
X1 = zscore(X(: , [2, 4 : 8]));
Y1 = Y(:,4);
n = size(Y1,1);
sigma = % 5.5;
lambda = % 3.7*10^-5;

for i = 1 : n
    L = unique([ol63;i]);
    Xtr = X1;
    Xte = Xtr(i,:);
    Xtr(L,:) = [];
    Htr = H1;
    Hte = H1(i,:);
    Htr(L,:) = [];
    Ytr = Y1;
    Ytr(L,:) = [];
    Yte = prednew(Xtr,Htr,Ytr,Xte,Hte,lambda,sigma);
    A(i,:) = [Y1(i,1),Yte(1,1)];
end

scatter(A(:,1) , A(:,2))
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    