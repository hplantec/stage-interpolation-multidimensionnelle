%% X and Y must be define
U=unique(X(:,4));
n=size(U);
for i = 1 : n
    L = X(:,2)==2 & X(:,4)==U(i);
    if sum(L) > 20
        scatter( X(L,3) , Y(L,4) , 20)
        title(['Prix 2015 en fonction de la hauteur pour P = ', num2str(U(i))])
        drawnow;
        pause;
    end
end