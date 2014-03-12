function out= optimisation_critere_rand(varargin)
%This function takes multiple optionnal arguments and send 

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


%The three following lines are the vectors with the values of lambda,
%sigma, and mu on which we take random values.

LAMBDA=[Lambda(1):(Lambda(2)-Lambda(1))/20:Lambda(2)];
SIGMA=[Sigma(1):(Sigma(2)-Sigma(1))/20:Sigma(2)];
MU=[Mu(1):(Mu(2)-Mu(1))/20:Mu(2)];


% Here we initiate the final values, in order to launch the calculus. The
% intial error has to be huge so taht it is replaced by the first
% calculated value.
err=10^10;
lambdaf=(Lambda(2)+Lambda(1))/2;
sigmaf=(Sigma(1)+Sigma(2))/2;
muf=(Mu(1)+Mu(2))/2;


l1=[LAMBDA(1) SIGMA(1) MU(1)];
l2=[LAMBDA(end) SIGMA(end) MU(end)];

for l=1:step
    siz=(l2-l1)/10^(l-1);
    LAMBDA=[lambdaf-size(1)/2:size(1)/20:lambdaf+size(1)/2];
    SIGMA=[sigmaf-size(2)/2:size(2)/20:sigmaf+size(2)/2];
    MU=[muf-size(3)/2:size(3)/20:muf+size(3)/2];

    L=LAMBDA(1,round(rand(1,accuracy)*20+1));
    S=SIGMA(1,round(rand(1,accuracy)*20+1));
    M=MU(1,round(rand(1,accuracy)*20+1));


   for i=1:size(L,2)
       errtemp=Kernel_ridge_regression_cubexp_parameters (X , Y , L(i) , S(i) , M(i) , nv , prop);
       if errtemp<err
           err=errtemp;
           lambdaf=L(i);
           sigmaf=S(i);
           muf=M(i);
       end
   end
end

out=[err,lambdaf,sigmaf,muf];


end


