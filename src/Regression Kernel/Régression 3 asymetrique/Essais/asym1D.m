

function[coef]=asym1D(X,Y,c,p)
X0 = c*(X-mean(X));
Y0 = c*Y;
Z = X0.*exp(Y0);
f=@(a) sum(Z.*exp(-a*X0));
g=@(a) -sum(X0.*Z.*exp(-a*X0));

x=0;
y=f(0);
while y*f(x+p*y/abs(y))>0
    x=x-f(x)/g(x);
    y=f(x);
end
a = x;
b = 1/c*log(1/size(X,1)*sum(exp(c*(Y-a*X))));
coef = [a;b];