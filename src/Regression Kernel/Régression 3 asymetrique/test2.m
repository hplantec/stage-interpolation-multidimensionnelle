% test sur 100%

load datav3
load outliers_63
Xtr = zscore(X(:,2:8));
Ytr = Y(:,4);
Xtr(ol63,:)=[];
Ytr(ol63,:)=[];
lambda = 10^-4.6895;
sigma = 3.1288;
c = 0.0044;
Yte = asymetrique3(Xtr,Ytr,Xtr,lambda,sigma,c);
figure(1)
scatter(Ytr,Yte)
hold on
plot([0,60000],[0,60000],'r')
hold off
erreur2 = mean(abs(Yte./Ytr-1))
proportion_au_dessus2 = sum(Yte>Ytr)/size(Ytr,1)
xlabel('Ytr')
ylabel('Yte')
title(['Prediction de Ytr avec une erreur de ',num2str(erreur2),' et une proportion de prix estimés par dessus de ',num2str(proportion_au_dessus2)])