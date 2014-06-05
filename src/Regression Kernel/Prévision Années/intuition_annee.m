

date = unique(X(:,8));
n = size(date,1);
for i = 1 : n
    L = X(:,8)==date(i);
    Xtr = [ones(sum(L),1),Y(L,3)];
    Ytr = Y(L,4);
    coef = (Xtr'*Xtr)\(Xtr'*Ytr);
    b = coef(1);
    a = coef(2);
    X(L,9) = b;
    X(L,10) = a;
end
figure(1)
scatter(X(:,8),X(:,10))
figure(2)
scatter(X(:,8),X(:,9))
figure(3)
scatter(Y(:,4),X(:,10).*Y(:,3)+X(:,9))
hold on
plot([0,4*10^4],[0,4*10^4],'r')
hold off