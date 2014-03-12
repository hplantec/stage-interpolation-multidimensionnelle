figure(1);
clf;

%On trace ici l'ensemble des droites Y(:,1) en fonction de X(:,3) lorsque
%X(:,2) X(:,4)et X(:,5) varient (en ne prenant pas en compte les cas où on a
%moins de 10 points... ça prend 15 secondes.
M2=unique(X(:,2));
M4=unique(X(:,4));
M5=unique(X(:,5));

for i=1:size(M2,1)
    for k=1:size(M4,1)
        for j=1:size(M5,1)
     L=X(:,2)==M2(i,1) & X(:,4)==M4(k,1) & X(:,5)==M5(j,1);
     if sum(L)>=10
     scatter(X(L,3),Y(L,1));
     pause(0.5);
     end
        end
    end
end
