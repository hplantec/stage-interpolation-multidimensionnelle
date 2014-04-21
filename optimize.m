% The function optimize returns the optimal values of sigma and
% -log10(lambda), using the function moy.
% We can use this function writting: "optimize(X, Y, nv, p)".

function[answer] = optimize(X, Y, nv, p)

for sigma = 0.1 : 0.1 : 3
    for ll = 1 : 16
        L1(floor(10*sigma+.5),ll) = sigma;
        M1(floor(10*sigma+.5),ll) = ll;
        N1(floor(10*sigma+.5),ll) = moy(X, Y, 10^(-ll), sigma, nv, p);
    end
end

coef1 = find(N1 == min(min(N1)));
coef1 = coef1(1,1);

% We found the optimal values of the both parameters, but not precise
% enough.

for sigma = L1(coef1)-0.05 : 0.01 : L1(coef1)+0.05;
    for ll = M1(coef1)-0.5 : 0.1 : M1(coef1)+0.5;
        L2(floor(100*sigma - 100*L1(coef1) + 6+.5),floor(10*ll - 10*M1(coef1)+6+.5)) = sigma;
        M2(floor(100*sigma - 100*L1(coef1) + 6+.5),floor(10*ll - 10*M1(coef1)+6+.5)) = ll;
        N2(floor(100*sigma - 100*L1(coef1) + 6+.5),floor(10*ll - 10*M1(coef1)+6+.5)) = moy(X, Y, 10^(-ll), sigma, nv, p);
    end
end

coef2 = find(N2 == min(min(N2)));
coef2 = coef2(1,1);

% We precised it.

for sigma = L2(coef2)-0.005 : 0.001 : L2(coef2)+0.005;
    for ll = M2(coef2)-0.05 : 0.01 : M2(coef2)+0.05;
        L3(floor(1000*sigma - 1000*L2(coef2) + 6+.5),floor(100*ll - 100*M2(coef2) + 6+.5)) = sigma;
        M3(floor(1000*sigma - 1000*L2(coef2) + 6+.5),floor(100*ll - 100*M2(coef2) + 6+.5)) = ll;
        N3(floor(1000*sigma - 1000*L2(coef2) + 6+.5),floor(100*ll - 100*M2(coef2) + 6+.5)) = moy(X, Y, 10^(-ll), sigma, nv, p);
    end
end

coef3 = find(N3 == min(min(N3)));
coef3 = coef3(1,1);

% We precised it again.

answer = [L3(coef3) , M3(coef3)];

% Finally, answer contains argmin(sigma) , argmin(-log10(lambda)).