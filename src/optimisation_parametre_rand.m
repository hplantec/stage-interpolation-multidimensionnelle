function [out1,out2]= optimisation_parametre_rand(varargin)
%This function takes multiple optionnal arguments and send back the optimal
%parameters which minimize the error between the kernel and the train data.
%In order to calculate the most precise parameters, we take random values
%of lambda sigma and mu in an interval (the number af those values taken is
%an input called accuracy) and we calculate the error for those values. We
%take the minimum and zoom on a smaller interval around this minimum (a
%ball in R3) a number of times called step.


load datav2.mat


p=inputParser;

%nv indicates the number of data sates on which we want to calulate the
%mean error.
defaultnv=100;

%p indicates the proportion of data on which we train our regression before
%testing it on the remaining data.
defaultprop=0.9;
defaultLambda=[0.0001 0.002];
defaultSigma=[0.5 10];
defaultMu=[0.5 10];
defaultstep=3;
defaultaccuracy=1000;


%Here we define which inputs are optional or necessary, here they all are
%optional.
addOptional(p,'accuracy',defaultaccuracy,@isnumeric);
addOptional(p,'nv',defaultnv,@isnumeric);
addOptional(p,'prop',defaultprop);
addOptional(p,'Lambda',defaultLambda);
addOptional(p,'Sigma',defaultSigma);
addOptional(p,'Mu',defaultMu);
addOptional(p,'step',defaultstep);

%This line is necessary for inputparser.
parse(p,varargin{:});

accuracy=p.Results.accuracy;
nv=p.Results.nv;
prop=p.Results.prop;
Lambda=p.Results.Lambda;
Sigma=p.Results.Sigma;
Mu=p.Results.Mu;
step=p.Results.step;

Xn=zscore(X);
Yn=zscore(Y);
%Here we create the vectors which includes the limits of our intervals for
%parameters' values.
LAMBDA=[Lambda(1) Lambda(2)];
SIGMA=[Sigma(1) Sigma(2)];
MU=[Mu(1) Mu(2)];


% Here we initiate what will be necessary for the loops to begin.
err=10^10;
lambdaf=(Lambda(2)+Lambda(1))/2;
sigmaf=(Sigma(1)+Sigma(2))/2;
muf=(Mu(1)+Mu(2))/2;
l1=[LAMBDA(1) SIGMA(1) MU(1)];
l2=[LAMBDA(end) SIGMA(end) MU(end)];
errall=[];
lambdaall=[];
sigmaall=[];
muall=[];


% Now we launch the loop which iterate on the number of steps we'e decided.
for l=1:step
    siz=(l2-l1)/10^(l-1);
    LAMBDA=[lambdaf-siz(1)/2 lambdaf+siz(1)/2];
    SIGMA=[sigmaf-siz(2)/2 sigmaf+siz(2)/2];
    MU=[muf-siz(3)/2 muf+siz(3)/2];
    
    

% And we launch, inside a step, the kernel script for as many times as
% we've decided in accuracy.
   for i=1:accuracy
       L=LAMBDA(1)+(LAMBDA(2)-LAMBDA(1))*rand;
       S=SIGMA(1)+(SIGMA(2)-SIGMA(1))*rand;
       M=MU(1)+(MU(2)-MU(1))*rand;
       errtemp=Kernel_ridge_regression_cubexp_parameters_dimensions (Xn , Yn , L , S , M , nv , prop);
       errall(size(errall,1)+1,1)=errtemp;
       lambdaall(size(lambdaall,1)+1,1)=L;
       sigmaall(size(sigmaall,1)+1,1)=S;
       muall(size(muall,1)+1,1)=M;
       if errtemp<err
           err=errtemp;
           lambdaf=L;
           sigmaf=S;
           muf=M;
       end
   end
end


%Let's note that the servor doesn't do the scatters by itself, so that it
%has to be launched afterwards on the computer (but it ain't no problem for
%the servor for running the script).

figure(1);
subplot(2,2,1);
scatter(lambdaall,errall);
xlabel('valeurs de lambda');
ylabel('erreurs obtenues');

subplot(2,2,2);
scatter(sigmaall,errall);
xlabel('valeurs de sigma');
ylabel('erreurs obtenues');

subplot(2,2,3);
scatter(muall,errall);
xlabel('valeurs de mu');
ylabel('erreurs obtenues');


out1=[err,lambdaf,sigmaf,muf];
out2=[errall,lambdaall,sigmaall,muall];

end


