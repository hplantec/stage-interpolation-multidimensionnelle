

function[Yte] = asymetriquefmin(Xtr, Ytr, Xte, lambda, sigma,c)

Xtr1 = [Xtr,ones(size(Xtr,1),1)];
A = (Xtr1'*Xtr1)\(Xtr1'*Ytr);
Ztr = Ytr - Xtr1*A;

n = size(Ztr,1);
k=@(x,y) exp(-pdist2(x,y).^2/(2*sigma^2));

Ktrtr = k(Xtr,Xtr);

eps=@(x) exp(c*x)-c*x-1; % eps
deps=@(x) c*(exp(c*x)-1); % eps'
f=@(x) sum(eps(Ztr-Ktrtr*x))/n + lambda*x'*Ktrtr*x; % f
g=@(x) Ktrtr*(2*lambda*x-deps(Ztr-Ktrtr*x)/n);  % df

f_and_df=@(x) deal(f(x),g(x));
options = optimset('GradObj','on');
x0 = (2*rand(n,1)-1)/sqrt(n); % demander à Emile
B= fminunc(f_and_df,x0,options);

Ktetr = k(Xte,Xtr);

Xte1 = [Xte,ones(size(Xte,1),1)];
Yte = Ktetr*B + Xte1*A;


% function [f df] = f_and_df(x)
%     f = x.^2;
%     df = 2*x;
% end
% 
% options = optimset('GradObj','on');
% x0 = 5;
% [x,fval] = fminunc(@f_and_df,x0,options);