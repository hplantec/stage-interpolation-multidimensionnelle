%% X and Y must be define
% This function draw the 4 graphs prices(heights)
x=0:0.1:75;
L= X(:,2)==2 & X(:,4)==1 & X(:,5)==1;
X1 = X(L,3) ; Y1 = Y(L,1);
n = size(X1,1);
for i = n :-1: 1
    for j = n :-1: 1
        if (X1(i)~=X1(j))
            a= (Y1(j)-Y1(i))/(X1(j)-X1(i));
            b= Y1(i) - a * X1(i);
            if (sum(Y1-a*X1>b)==0)
                A=a;
                B=b;
            end
            if (sum(Y1-a*X1<b)==0)
                C=a;
                D=b;
            end
        end
    end
end
[A B
 C D];
subplot(2,2,1)
plot( x , A*x+B)
hold on
plot( x , C*x+D)
scatter ( X1, Y1, 10)
title(['Prix 2012 en fonction de la hauteur ']) 
hold off

L= X(:,2)==2 & X(:,4)==1 & X(:,5)==1;
X1 = X(L,3) ; Y1 = Y(L,2);
n = size(X1,1);
for i = n :-1: 1
    for j = n :-1: 1
        if (X1(i)~=X1(j))
            a= (Y1(j)-Y1(i))/(X1(j)-X1(i));
            b= Y1(i) - a * X1(i);
            if (sum(Y1-a*X1>b)==0)
                A=a;
                B=b;
            end
            if (sum(Y1-a*X1<b)==0)
                C=a;
                D=b;
            end
        end
    end
end
[A B
 C D];
subplot(2,2,2)
plot( x , A*x+B)
hold on
plot( x , C*x+D)
scatter ( X1, Y1,10)
title(['Prix 2013 en fonction de la hauteur '])
hold off

L= X(:,2)==2 & X(:,4)==1 & X(:,5)==1;
X1 = X(L,3) ; Y1 = Y(L,3);
n = size(X1,1);
for i = n :-1: 1
    for j = n :-1: 1
        if (X1(i)~=X1(j))
            a= (Y1(j)-Y1(i))/(X1(j)-X1(i));
            b= Y1(i) - a * X1(i);
            if (sum(Y1-a*X1>b)==0)
                A=a;
                B=b;
            end
            if (sum(Y1-a*X1<b)==0)
                C=a;
                D=b;
            end
        end
    end
end
[A B
 C D];
subplot(2,2,3)
plot( x , A*x+B)
hold on
plot( x , C*x+D)
scatter ( X1, Y1, 10)
title(['Prix 2014 en fonction de la hauteur '])
hold off

L= X(:,2)==2 & X(:,4)==1 & X(:,5)==1;
X1 = X(L,3) ; Y1 = Y(L,4);
n = size(X1,1);
for i = n :-1: 1
    for j = n :-1: 1
        if (X1(i)~=X1(j))
            a= (Y1(j)-Y1(i))/(X1(j)-X1(i));
            b= Y1(i) - a * X1(i);
            if (sum(Y1-a*X1>b)==0)
                A=a;
                B=b;
            end
            if (sum(Y1-a*X1<b)==0)
                C=a;
                D=b;
            end
        end
    end
end
[A B
 C D];
subplot(2,2,4)
plot( x , A*x+B)
hold on
plot( x , C*x+D)
scatter ( X1, Y1, 10)
title(['Prix 2015 en fonction de la hauteur '])
hold off