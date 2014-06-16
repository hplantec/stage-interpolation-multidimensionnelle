

function[err] = errreg4(Xtr, Htr, Ytr, Xte, Hte, Yte, lambda, sigma1, sigma2)

err = Yte - predreg4(Xtr, Htr, Ytr, Xte, Hte, lambda, sigma1, sigma2);
err2 = err./Yte;
err = [mean(abs(err2)),sqrt(mean((err2).^2)),max(abs(err2)),sqrt(mean((err).^2))/sqrt(mean(Yte.^2))];
