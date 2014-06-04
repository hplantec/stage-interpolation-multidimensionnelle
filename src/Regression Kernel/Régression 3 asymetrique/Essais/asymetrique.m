% load datav3
% X = zscore(X(:,2:8));
% Y = Y(:,4);
% lambda = 1.5*10^-5;
% sigma = 1.37;
% c = 0.02;


function[F] = asymetrique(X,Y,lambda,sigma,c)

%k=@(x,y) exp(-pdist2(x,y).^2/(2*sigma^2));
k=@(x,y) x*y';
K = k(X,X);
n = size(Y,1);
L = [exp(1),zeros(1,n)];
M = -2*lambda*n*inv(K)/c^2;
V = 1-c*M*Y;
N = [L;[V,M]];
% find B tq exp(B)=NB

f=@(x) sum((exp(x)-N*x).^2); % f
g=@(x) 2*((exp(x)*ones(1,n+1)).*eye(n+1)-N')*(exp(x)-N*x);  % df
h=@(x) sum(g(x).^2); % ||df||^2

% % % % % % % B = rand(n+1,1);
% a=f(B);
% b=max(abs(g(B)));
% c=h(B)
% a/c*b
% % % % % % % i = 0;
% % % % % % % T = 1;
% % % % % % % while T == 1
% % % % % % %     i=i+1;
% % % % % % %     F(i,1) = f(B);
% % % % % % %     V = g(B)/10^78; % f*g/h
% % % % % % %     Z(i,1) = max(abs(V))
% % % % % % %     if Z(i,1)<10^-3
% % % % % % %         T=0;
% % % % % % %     end
% % % % % % %     B = B - V;
% % % % % % % end
%Z

% % other way
% 
% [P,D] =  eig(N); % N = PDP^-1
% 
%     %find C tq exp(PC) = PDC
% 
% B = P*C
% 
% % end find B tq exp(B)=NB
A = K\(Y-B(2:n+1,1)/c);


F = f(B)




