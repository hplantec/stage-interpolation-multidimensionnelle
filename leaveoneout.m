

load('datav3.mat')
X = X(: , 2 : 8);
Y = Y(:,4);
n = size(Y,1);
sigma = 1.37;
lambda = 1.5*10^-5;

for i = 1 : n
    Xtr = X;
    Xte = Xtr(i,:);
    Xtr(i,:) = [];
    Ytr = Y;
    Ytr(i,:) = [];
    Yte = pred(Xtr,Xte,Ytr,lambda,sigma);
    A(i,:) = [Y(i,1),Yte(1,1)];
end

scatter(A(:,1) , A(:,2))