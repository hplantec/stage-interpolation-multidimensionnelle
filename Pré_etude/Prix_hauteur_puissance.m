%% X and Y must be define
L= X(:,2)==2;
for i = 2012 : 2015
scatter( log(X(L,4)) , X(L,3) , 30 , log(Y(L,i-2011)) , 'filled')
colorbar;
title(['log(Prix( ' , num2str(i) , ')) en fonction de log(Puissance) et Hauteur'])
drawnow;
pause;
end