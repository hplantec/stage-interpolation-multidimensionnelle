

function[err] = errorm2(Xtr,htr,Ytr,Xte,hte,Yte,lambda1, lambda2,sigma1, sigma2)

err = Yte - prednew(Xtr,htr,Ytr,Xte,hte,lambda1, lambda2,sigma1, sigma2);
err2 = err./Yte;
err = [mean(abs(err2)),sqrt(mean((err2).^2)),max(abs(err2)),sqrt(mean((err).^2))/sqrt(mean(Yte.^2))];
