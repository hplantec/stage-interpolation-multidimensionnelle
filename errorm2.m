

function[err] = errorm2(Xtr,htr,Ytr,Xte,hte,Yte,lambda,sigma)

k=@(x,y) exp(-pdist2(x,y).^2/(2*sigma^2));
n = size(Xtr,1);
m = size(Xte,1);
Ktrtr = k(Xtr,Xtr);
Ktetr = k(Xte,Xtr);
Htrtr = htr*htr' + ones(n);
Htetr = hte*htr' + ones(m,n);
A = (Htrtr.*Ktrtr + lambda*n*eye(n))\Ytr;
err = Yte - (Htetr.*Ktetr)*A;
err = err./Yte;
err = [mean(abs(err)),sqrt(mean((err).^2)),max(abs(err))];