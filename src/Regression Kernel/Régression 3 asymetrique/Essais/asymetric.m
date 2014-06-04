function[] = asymetric(Xtr, Ytr, Xte, lambda, sigma, mu,  alpha, nv)

n = size(Xtr,1);
Ktrtr = (Xtr*Xtr').^3 + mu * exp((-(Xtr*ones(1, size(Xtr,1)) - ones(size(Xtr,1),1)*Xtr').^2)/(2*sigma^2));
Ktetr = (Xte*Xtr').^3 + mu * exp((-(Xte*ones(1, size(Xtr,1)) - ones(size(Xte,1),1)*Xtr').^2)/(2*sigma^2));
A = (Ktrtr + lambda * n * eye(n))\Ytr;
% Yte = Ktetr*A;
% figure(1);
% scatter(Xtr, Ytr);
% hold on
% scatter(Xte, Yte, 'r');
% hold off

for i = 1 : nv
    A = Ktrtr\(Ytr + log(1 - 2*lambda*A/alpha));
    % Yte = Ktetr*A;
    % figure(i+1);
    % scatter(Xtr, Ytr);
    % hold on
    % scatter(Xte, Yte, 'r');
    % hold off
end

Yte = Ktetr*A;
figure(nv+1);
scatter(Xtr, Ytr);
hold on
scatter(Xte, Yte, 'r');
hold off

Y = Ktrtr*A;
figure(nv+2);
L  = (Y < Ytr);
scatter(Xte(L,1) , Y(L,1));