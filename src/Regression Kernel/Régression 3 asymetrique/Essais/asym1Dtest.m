

% load('datav3.mat')
% X = zscore(X(:,3));
% Y = zscore(Y(:,4));
% x = [-5 : 0.1 : 10]';

x = [0:0.1:150]';
X = [1:100]' + 10*rand(100,1);
Y = [1 : 2 : 200]' + 2*rand(100,1);


coef = asym1D(X,Y,3,0.0001);
a = coef(1)
b = coef(2)

figure(1)
scatter(X,Y)
hold on
plot(x,a*x+b,'r')

s = size(X,1);
sx = sum(X);
c = sum(X.^2);
sy = sum(Y);
sxy = sum(X.*Y);
coef = [ s , -sx ; -sx , c ]*[sxy ; sy]/(s*c-sx^2);
a0 = coef(1)
b0 = coef(2)

plot(x,a0*x+b0, 'g')
hold off

sum((a*X+b-Y)<0)