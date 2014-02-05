%% X and Y must be define
% L1, L2 and L3 are logicals vectors separating the lines of X according to
% the straights in which each point is.

L1 = X(:,2)==2 & X(:,4)==1 & (Y(:,4)-30*X(:,3))<600;
L2 = X(:,2)==2 & X(:,4)==1 & (Y(:,4)-30*X(:,3))>600 & (Y(:,1)-40*X(:,3))<700;
L3 = X(:,2)==2 & X(:,4)==1 & (Y(:,4)-40*X(:,3))>700;
X11=X(L1,:) ; Y11=Y(L1,4) ;
X12=X(L2,:) ; Y12=Y(L2,4) ;
X13=X(L3,:) ; Y13=Y(L3,4) ;
figure(20151) ; scatter(X11(:,3), Y11, 10)
figure(20152) ; scatter(X12(:,3), Y12, 10)
figure(20153) ; scatter(X13(:,3), Y13, 10)