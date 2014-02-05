%% X and Y must be define
% L1, L2 and L3 are logicals vectors separating the lines of X according to
% the straights in which each point is.

L1 = X(:,2)==2 & X(:,4)==1 & (Y(:,4)-30*X(:,3))<600;
L2 = X(:,2)==2 & X(:,4)==1 & (Y(:,4)-30*X(:,3))>600 & (Y(:,1)-40*X(:,3))<700;
L3 = X(:,2)==2 & X(:,4)==1 & (Y(:,4)-40*X(:,3))>700;
X11=X(L1,:) ; Y11=Y(L1,4) ;
X12=X(L2,:) ; Y12=Y(L2,4) ;
X13=X(L3,:) ; Y13=Y(L3,4) ;
M1=[sum(X11(:,3).*X11(:,3)) , sum(X11(:,3)) ; sum(X11(:,3)) , size(X11(:,3),1)]\[sum(X11(:,3).*Y11) ; sum(Y11)]
M2=[sum(X12(:,3).*X12(:,3)) , sum(X12(:,3)) ; sum(X12(:,3)) , size(X12(:,3),1)]\[sum(X12(:,3).*Y12) ; sum(Y12)]
M3=[sum(X13(:,3).*X13(:,3)) , sum(X13(:,3)) ; sum(X13(:,3)) , size(X13(:,3),1)]\[sum(X13(:,3).*Y13) ; sum(Y13)]
a1=M1(1) ; b1=M1(2);
a2=M2(1) ; b2=M2(2);
a3=M3(1) ; b3=M3(2);
figure(20151) ; scatter(X11(:,3), Y11, 10)
hold on
x=10:0.1:60;
plot(x, a1*x+b1, 'm')
hold off
figure(20152) ; scatter(X12(:,3), Y12, 10)
hold on
x=0:0.1:80;
plot(x, a2*x+b2, 'y')
hold off
figure(20153) ; scatter(X13(:,3), Y13, 10)
hold on
x=10:0.1:60;
plot(x, a3*x+b3, 'g')
hold off
figure(20150) ; L= (L1+L2+L3>0) ; scatter(X(L,3), Y(L,4) , 10)
hold on
x=0:0.1:80;
plot(x, a1*x+b1, 'm')
plot(x, a2*x+b2, 'y')
plot(x, a3*x+b3, 'g')
hold off