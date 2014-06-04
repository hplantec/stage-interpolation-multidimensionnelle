

clear all
load('datav3.mat')
sigma = 1.37;
lambda = 1.5*10^-5;
[Xtr,Xmu,Xsigma] = zscore(X(:,2:8));
Ytr = Y(:,4);

L = [-0.5   -3   -0.1   -2
   13    10   25    5];
M = [1,2,3,7];
N = {'Nb de panneaux','Hauteur','Puissance','Date'};

for i = 1 : 3
    for j = i+1 : 4

Xte = repmat([-0.4537,0,0.0907,-0.1809,0.2609,-0.6601,0.2000],900,1);
[H,P] = meshgrid(linspace(L(1,i),L(2,i),30),linspace(L(1,j),L(2,j),30));
HP = [H(:) P(:)];
Xte(:,M(i)) = HP(:,1);
Xte(:,M(j)) = HP(:,2);
Yte = pred(Xtr,Xte,Ytr,lambda,sigma);

figure
gr = pcolor(Xsigma(M(i))*H + Xmu(M(i)), Xsigma(M(j))*P + Xmu(M(j)), reshape(Yte,30,30));
set(gr,'edgecolor', 'none');
xlabel(N(i),'fontsize',14);
ylabel(N(j),'fontsize',14);
colorbar;

    end    
end








