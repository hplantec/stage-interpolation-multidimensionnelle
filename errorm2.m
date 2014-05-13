

function[err] = errorm2(Xtr,htr,Ytr,Xte,hte,Yte,lambda,sigma)

err = Yte - prednew(Xtr,htr,Ytr,Xte,hte,lambda,sigma);
err2 = err./Yte;
err = [mean(abs(err2)),sqrt(mean((err2).^2)),max(abs(err2)),sqrt(mean((err).^2))/sqrt(mean(Yte.^2))];
