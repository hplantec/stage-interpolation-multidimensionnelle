

function[err] = errorm_annee(Xtr, Ytr2014, Ytr2015, Xte, Yte2015, lambda, sigma)

err = abs(1-pred_annee(Xtr,Ytr2014,Ytr2015,Xte,lambda,sigma)./Yte2015);
err = [mean(err),sqrt(mean(err.^2)),max(err)];