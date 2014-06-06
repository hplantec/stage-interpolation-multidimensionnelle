load datav3
load outliers_63
X(ol63,:)=[];
Y(ol63,:)=[];

date = unique(X(:,8));
n = size(date,1);
for i = 1 : n
    L = X(:,8)==date(i);
    Xtr = [ones(sum(L),1),Y(L,3)];
    Ytr = Y(L,4);
    coef = (Xtr'*Xtr)\(Xtr'*Ytr);
    b = coef(1);
    a = coef(2);
    A(L,1) = b;
    A(L,2) = a;
end


figure(1)
scatter(X(:,8),A(:,2))
title('coefficient directeur de Y(:,4) par rapport à Y(:,3)')
xlabel('dates')
ylabel('coefficient directeur')

figure(2)
scatter(X(:,8),A(:,1))
title('ordonnée à lorigine')
xlabel('dates')
ylabel('ordonnée à lorigine')


figure(3)
scatter(Y(:,4),A(:,2).*Y(:,3)+A(:,1))
hold on
plot([0,4*10^4],[0,4*10^4],'r')
hold off
title('comparaison des valeurs prédites et valeurs réelles')
xlabel('valeurs réelles')
ylabel('prévisions Y(:,4)=a*Y(:,3)+b')