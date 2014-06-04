

function[A] = asymetrique(X,Y,lambda,sigma,c)

n = size(Y,1);
k=@(x,y) exp(-pdist2(x,y).^2/(2*sigma^2));
K = k(X,X);

eps=@(x) exp(c*x)-c*x-1; % eps
deps=@(x) c*(exp(c*x)-1); % eps'
f=@(x) sum(eps(Y-K*x))/n + lambda*x'*K*x; % f
g=@(x) K*(2*lambda*x-deps(Y-K*x)/n);  % df
h=@(x) sum(g(x).^2); % ||df||^2

A = 2/sqrt(n)*rand(n,1)-1/sqrt(n); % demander à Emile

T = 1;
while T == 1
    V = g(A);
    A = A-f(A)*V/h(A);
    if max(abs(V))<10^-3
        T=0;
    end
end