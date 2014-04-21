% The function errorm is trained on (Xtr,Ytr).
% It returns the error on the regression on (Xte,Yte).
% The regression used is a linear one and then a normal ridge regression
% with sigma the standard deviation of the normal and lambda the
% smoothness indicator.
% We can use this function writting: "errorm(Xtr, Ytr, Xte, Yte, lambda,
% sigma)".

function[err] = errorm(Xtr, Ytr, Xte, Yte, lambda, sigma)

A = (Xtr'*Xtr)\(Xtr'*Ytr);
Ztr = Ytr - Xtr*A;
Zte = Yte - Xte*A;
% We have just trained linearly on (Xtr,Ytr).
% Ztr is the error between the value Yte and her linear prediction.

k=@(x,y) exp(-pdist2(x,y).^2/(2*sigma^2));
n = size(Xtr,1);
Ktrtr = k(Xtr,Xtr);
Ktetr = k(Xte,Xtr);
B = (Ktrtr + lambda*n*eye(n))\Ztr;
erreur_absolue = Zte - Ktetr*B;
% Here, we trained on this error with Kernel Ridge Regression.

erreur_relative = (erreur_absolue)./Yte;
err = mean(abs(erreur_relative));
% Finally, err contains the relative error of the final prediction, the
% goal being to minimize it.