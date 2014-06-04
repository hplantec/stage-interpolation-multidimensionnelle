 load('datav3.mat')

X(:,8) = (X(:,8)-min(X(:,8)))/(max(X(:,8))-min(X(:,8)));
X(:,10) = X(:,8) + 2*X(:,6) + 4*X(:,7) + 100*X(:,4) + 1000000*X(:,2);
A = unique(X(:,10));
n= size(A,1);
X(:,11) = 0;
X(:,12) = 0;
X(:,13) = 0;

for i = 1 : n
    L = X(:,10) == A(i,1);
    X2=X(L,2);X2=X2(1,1);
    X4=X(L,4);X4=X4(1,1);
    X6=X(L,6);X6=X6(1,1);
    X7=X(L,7);X7=X7(1,1);
    X8=X(L,8);X8=X8(1,1);
    if sum(L) > 1
        Xi = X(L,3); Yi = Y(L,4);
        m = size(Xi,1);
        M = [ m , -sum(Xi) ; -sum(Xi) , sum(Xi.*Xi) ];
        V = [ sum(Xi.*Yi)  ; sum(Yi) ];
        D = m*sum(Xi.*Xi)-sum(Xi)^2;
        coef = M*V/D;
        a=coef(1);
        b=coef(2);
        X(L,11) = a;
        X(L,12) = b;
    end
end

% T = X(:,8) + 2*X(:,6) + 4*X(:,7) + 4*X(:,2);
% U = unique(T);
% s = size(U,1);

% for j = 1 : s
%     test = (T == U(j) & X(:,11)~=0 & X(:,12)~=0);
%     if sum(test)>0
%         X(test,13) = mean(X(test,11));
%         X(test,14) = mean(X(test,12));
%     end 
% end
 
 T = X(:,2)/50 + 2*X(:,6) + 4*X(:,7) + 100*X(:,4);
 U = unique(T);
 s = size(U,1);

 for j = 1 : s
     test = (T == U(j) & X(:,11)~=0 & X(:,12)~=0 & X(:,11)<100);
     if sum(test)>4
         scatter(X(test,8), X(test,11))
         drawnow;
         pause;
     end
 end
 
 
 

 
 
 
 
 
 
 