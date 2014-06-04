

load('datav3.mat')


X(:,10) = X(:,6) + 2* X(:,7) + 4 * X(:,5) + 4 * X(:,2) + 2000* X(:,4) + 400000*(X(:,8)-735219);
U = unique(X(:,10));
n = size(U);
for i = 1 : n
    L = X(:,10) == U(i);
    s = sum(L);
    if sum(L) > 1
        sx = sum(X(L,3));
        c = sum(X(L,3).^2);
        sy = sum(Y(L,4));
        sxy = sum(X(L,3).*Y(L,4));
        coef = [ s , -sx ; -sx , c ]*[sxy ; sy]/(s*c-sx^2);
        X(L,11) = coef(1);
        X(L,12) = coef(2);
        scatter(X(L,3),Y(L,4))
        AZERTY = (X(L,[2,4:8]));
        title(AZERTY(1,:))
        drawnow
        pause
    end
end


% L = (X(:,11) == 0 & X(:,12)==0);
% X(L,:) = [];
% 
% 
% X(:,13) = X(:,6) + 2* X(:,7) + 4 * X(:,5) + 2000* X(:,4) + 400000*(X(:,8)-735219);
% U = unique(X(:,13));
% n = size(U);
% for i = 1 : n
%     L = X(:,13)==U(i);
%     X(L,1) = i;
% end
% figure(1)
% scatter3(log(X(:,2)) , X(:,1) , log(X(:,11)))
% figure(2)
% scatter3(log(X(:,2)) , X(:,1) , log(X(:,12)))