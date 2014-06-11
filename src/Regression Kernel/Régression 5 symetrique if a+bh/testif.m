
load datav3
load outliers_63
X(ol63,:) = [];
Y(ol63,:) = [];
H = X(:,3);
X = zscore(X(:,[2,4:8]));
Y = Y(:,4);

nv = 4;
nr = 100;
p = 0.9;

tic; opt = optimizeif(X, H, Y, nv, nr, p); toc

% figure(1)
% scatter(opt(:,1),log(opt(:,5)));
% xlabel('-log(lambda)')
% ylabel('log(erreur 1)')
% 
% for i=2:4
% figure(i)
% scatter(opt(:,i),log(opt(:,5)))
% xlabel(['sigma ',num2str(i-1)])
% ylabel('log(erreur 1)')
% end
% opt(find(opt(:,5)==min(opt(:,5))),:)

% % ll=4.48;
% % sigma1=-0.0348;
% % sigma2=3.2281;
% % sigma3=25.7547;
% % erreur1=1.04%;

% % ll=5.8802;
% % sigma1=0.0441; gaussian
% % sigma2=16.6473; matérn 5/2
% % sigma3=21.3816; matérn 5/2
% % erreur1=0.73%;
% % erreur2=1.87%;
% % erreursup=16.91%;