

load('datav3.mat')
load('outliers_63.mat')

X2=zeros(size(X));
X2(ol63,:)=X(ol63,:);
A = X(:,6) + 2* X(:,7) + 4 * X(:,5) + 4 * X(:,2) + 2000* X(:,4) + 400000*(X(:,8)-735219);
U = unique(A);
n = size(U);


for i=1:63
    L = X(:,2)==X(ol63(i),2) & X(:,4)==X(ol63(i),4) & X(:,5)==X(ol63(i),5) & X(:,6)==X(ol63(i),6) & X(:,7)==X(ol63(i),7) & X(:,8)==X(ol63(i),8);
    if sum(L)>2
        scatter(X(L,3),Y(L,4),'fill')
        hold on
        AZERTY = (X(L,[2,4:8]));
        L2 = X2(:,2)==X2(ol63(i),2) & X2(:,4)==X2(ol63(i),4) & X2(:,5)==X2(ol63(i),5) & X2(:,6)==X2(ol63(i),6) & X2(:,7)==X2(ol63(i),7) & X2(:,8)==X2(ol63(i),8);
        scatter(X(L2,3),Y(L2,4),'r','fill')
        legend('X','X(ol63)',-1)
        title(AZERTY(1,:));
        hold off
        drawnow
        pause
    end
end
