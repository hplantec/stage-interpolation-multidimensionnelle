function [Xtrain,Xtest,Ytrain,Ytest]= split(X1,Y1,prop)

%On définit avec hasard, un Xtrain sur lequel on entraine la
%regression,idem pour Ytrain. Puis on crée les Xtest et Ytest avec les
%valeurs de X et Y qu'il reste.

L=transpose(randperm(size(X1,1)));

L1=L(1:floor(prop*size(X1,1)),1);

Xtrain=X1(L1,:);
Ytrain=Y1(L1,:);

L2=L(size(L1,1)+1:size(L,1));

Xtest=X1(L2,:);
Ytest=Y1(L2,:);