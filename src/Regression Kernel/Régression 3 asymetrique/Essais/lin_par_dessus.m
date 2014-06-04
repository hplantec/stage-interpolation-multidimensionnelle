%% This function plot the linear regression with nonnegative error

function[]= lin_par_dessus(X,Y)

n= size(X,1);
a1 = X * ones(1,n)-ones(n,1) * X';
a2 = Y * ones(1,n)-ones(n,1) * Y';
a = sum(a1.*a2)./sum(a1.*a1);
R = Y*ones(1,n)-X*a;
D = (max(R)'-diag(R)).^2;
m = min(D);
L = (D == m);
ak = a';
ak = ak(L,1);
bk = (max(Y*ones(1,size(ak,1))-X*ak'))';
eps = (sum((Y*ones(1,size(ak,1))-X*ak'-ones(size(X,1),1)*bk').^2))';
L = (eps == min(eps));
A = ak(L,1);
B = bk(L,1);
if size(A,1)>0
a = A(1,1);
b = B(1,1);
Z = a*X+b;
scatter(X,Y)
hold on
plot(X,Z,'r')
hold off
end