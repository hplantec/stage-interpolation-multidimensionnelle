function [out1,out2]= optimisation_parametre_rand(varargin)
%This function takes multiple optionnal arguments and send back the optimal
%parameters which minimize the error between the kernel and the train data.
%In order to calculate the most precise parameters, we take random values
%of lambda sigma and mu in an interval (the number af those values taken is
%an input called accuracy) and we calculate the error for those values. We
%take the minimum and zoom on a smaller interval around this minimum (a
%ball in R3) a number of times called step.


load datav3.mat


p=inputParser;

%nv indicates the number of data sates on which we want to calulate the
%mean error.
defaultnv=10;

%p indicates the proportion of data on which we train our regression before
%testing it on the remaining data.
defaultprop=0.9;
defaultLambda=[-20 -10];
defaultSigma=[2 7];
defaultl=[0 10];
defaults=[0 5];
defaultc=[0.05 0.2];
defaultstep=3;
defaultaccuracy=1000;


%Here we define which inputs are optional or necessary, here they all are
%optional.
addOptional(p,'nv',defaultnv,@isnumeric);
addOptional(p,'prop',defaultprop);
addOptional(p,'Lambda',defaultLambda);
addOptional(p,'Sigma',defaultSigma);
addOptional(p,'l',defaultl);
addOptional(p,'s',defaults);
addOptional(p,'c',defaultc);
addOptional(p,'step',defaultstep);
addOptional(p,'accuracy',defaultaccuracy,@isnumeric);

%This line is necessary for inputparser.
parse(p,varargin{:});

nv=p.Results.nv;
prop=p.Results.prop;
Lambda=p.Results.Lambda;
Sigma=p.Results.Sigma;
l=p.Results.l;
s=p.Results.s;
c=p.Results.c;
step=p.Results.step;
accuracy=p.Results.accuracy;

Xn=zscore(X);
Yn=zscore(Y);

% Here we initiate what will be necessary for the loops to begin.
err=10^10;
lambdaf=(Lambda(1)+Lambda(2))/2;
sigmaf=(Sigma(1)+Sigma(2))/2;
lf=(l(1)+l(2))/2;
sf=(s(1)+s(2))/2;
cf=(c(1)+c(2))/2;
l1=[Lambda(1) Sigma(1) l(1) s(1) c(1)];
l2=[Lambda(end) Sigma(end) l(end) s(end) c(end)];
errall=[];
lambdaall=[];
sigmaall=[];
lall=[];
sall=[];
call=[];


% Now we launch the loop which iterate on the number of steps we'e decided.
for j=1:step
    siz=(l2-l1)/10^(j-1);
    Lambda=[lambdaf-siz(1)/2 lambdaf+siz(1)/2];
    Sigma=[sigmaf-siz(2)/2 sigmaf+siz(2)/2];
    Linear=[lf-siz(3)/2 lf+siz(3)/2];
    Square=[sf-siz(4)/2 sf+siz(4)/2];
    Cubic=[cf-siz(5)/2 cf+siz(5)/2];

% And we launch, inside a step, the kernel script for as many times as
% we've decided in accuracy.
   for m=1:accuracy
       L=2^(log2(Lambda(2))+(log2(Lambda(1))-log2(Lambda(2)))*rand);
       S=Sigma(1)+(Sigma(2)-Sigma(1))*rand;
       L2=Linear(1)+(Linear(2)-Linear(1))*rand;
       S2=Square(1)+(Square(2)-Square(1))*rand;
       C=Cubic(1)+(Cubic(2)-Cubic(1))*rand;
       errtemp=Kernel_ridge_regression_poly3exp_parameters_dimensions (Xn , Yn , L , S , L2 , S2 , C , nv , prop);
       errall(size(errall,1)+1,1)=errtemp;
       lambdaall(size(lambdaall,1)+1,1)=2^L;
       sigmaall(size(sigmaall,1)+1,1)=S;
       lall(size(lall,1)+1,1)=L2;
       sall(size(sall,1)+1,1)=S2;
       call(size(call,1)+1,1)=C;
       if errtemp<err
           err=errtemp;
           lambdaf=L;
           sigmaf=S;
           lf=L2;
           sf=S2;
           cf=C;
       end
   end
end

lambdaf=2^lambdaf;


%Let's note that the servor doesn't do the scatters by itself, so that it
%has to be launched afterwards on the computer (but it ain't no problem for
%the servor for running the script).

figure(1);
subplot(2,3,1);
scatter(lambdaall,errall);
xlabel('valeurs de lambda');
ylabel('erreurs obtenues');

subplot(2,3,2);
scatter(sigmaall,errall);
xlabel('valeurs de sigma');
ylabel('erreurs obtenues');

subplot(2,3,3);
scatter(lall,errall);
xlabel('valeurs du coefficient linéaire');
ylabel('erreurs obtenues');

subplot(2,3,4);
scatter(sall,errall);
xlabel('valeurs du coefficient carré');
ylabel('erreurs obtenues');

subplot(2,3,5);
scatter(call,errall);
xlabel('valeurs du coefficient cubique');
ylabel('erreurs obtenues');


out1=[err,lambdaf,sigmaf,lf,sf,cf];
out2=[errall,lambdaall,sigmaall,lall,sall,call];

end


