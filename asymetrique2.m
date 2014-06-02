
function[A] = asymetrique2(X,Y,lambda,sigma,c)

n = size(Y,1);
k=@(x,y) exp(-pdist2(x,y).^2/(2*sigma^2));
K = k(X,X);

eps=@(x) exp(c*x)-c*x-1; % eps
deps=@(x) c*(exp(c*x)-1); % eps'
f=@(x) sum(eps(Y-K*x))/n + lambda*x'*K*x; % f
g=@(x) K*(2*lambda*x-deps(Y-K*x)/n);  % df
h=@(x) sum(g(x).^2); % ||df||^2

A = rand(n,1);
i = 1;
T = 1;
F(i,1) = f(A);
V = g(A);
Z(i,1) = max(abs(V));
while T == 1
    %A = A - e*V; % minimize e -> f(A-e*V)
                  % solve df(A-e*V)(V)=0
                  % solve <g(A-e*V)|V>=0
    a = -2*lambda*V'*K*V;
    b = V'*K*(2*lambda*A+c/n);
    Vect = (-c*K*V.*exp(c*(Y-K*A))/n);
    E=@(e) exp(c*e*(K*V)')*Vect + a*e+b; % cette fonction est décroissante %E(0) = sum(Vect)+b
    signe = sum(Vect)+b;
    signe = signe/abs(signe);
    m = -20;M = 10;p = 1;
    for j = 1 : 10
        e = signe*exp([m:p:M]'*log(10));
        ImagE1 = E(e);
        ImagE2 = ImagE1;
        ImagE1(1) = [];
        ImagE2(size(ImagE2,1))=[];
        ImagE = ImagE1.*ImagE2;
        indice = find(ImagE<0);
        if size(indice,1)>0
            indice = indice(1);
            m = m+(indice-1)*p;
            M = m+p;
            p=p/10;
        else
            M = M+10*p;
        end 
    end
    e = signe*exp(m*log(10));
    A = A-e*V;
%   A = A-(10^-11.638474048)*V;
    i=i+1;
    F(i,1) = f(A);
    V = g(A);
    Z(i,1) = max(abs(V))
    if Z(i,1)<10^-2
        T=0;
    end
end




