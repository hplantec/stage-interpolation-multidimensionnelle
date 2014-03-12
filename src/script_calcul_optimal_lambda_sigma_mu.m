function [err,lambdaf,sigmaf,muf]= optmisation_critere(varargin)


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


%Here we define which inputs are optional or necessary, here they all are
%optional.
addOptional(p,'nv',defaultnv,@isnumeric);
addOptional(p,'prop',defaultprop);
addOptional(p,'Lambda',defaultLambda);
addOptional(p,'Sigma',defaultSigma);
addOptional(p,'Mu',defaultMu);
addOptional(p,'step',defaultstep);

%This line is necessary for inputparser.
parse(p,varargin{:});

nv=p.Results.nv;
prop=p.Results.prop;
Lambda=p.Results.Lambda;
Sigma=p.Results.Sigma;
Mu=p.Results.Mu;
step=p.Results.step;


%The three following lines are the vectors with the values of lambda,
%sigma, and mu on which we want to test the regression.
LAMBDA=[Lambda(1):(Lambda(2)-Lambda(1))/20:Lambda(2)];
SIGMA=[Sigma(1):(Sigma(2)-Sigma(1))/20:Sigma(2)];
MU=[Mu(1):(Mu(2)-Mu(1))/20:Mu(2)];


%The following line is useful to initiate the error with an incredible
%value so that at the first step it is replaced by the calculated error.
err=10^10;
lambdaf=(Lambda(2)+Lambda(1))/2;
sigmaf=(Sigma(1)+Sigma(2))/2;
muf=(Mu(1)+Mu(2))/2;


%The first loop is reiterring the calculus with more steps in order to
%increase the accuracy.
for l=1:step
    l1=LAMBDA(1);
    l2=LAMBDA(end);
    size=(l2-l1)/10^(l-1);
    LAMBDA=[lambdaf-size/2:size/20:lambdaf+size/2];
    l1=SIGMA(1);
    l2=SIGMA(end);
    size=(l2-l1)/10^(l-1);
    SIGMA=[sigmaf-size/2:size/20:sigmaf+size/2];
    l1=MU(1);
    l2=MU(end);
    size=(l2-l1)/10^(l-1);
    SIGMA=[muf-size/2:size/20:muf+size/2];
    
    %The other loops are to calculate the error with every single value of
    %lambda, sigma and mu.
    for i=1:20
        for j=1:20
            for k=1:20
            errtemp=Kernel_ridge_regression_linexp_parameters (X , Y , LAMBDA(i) , SIGMA(j) , MU(k) , nv , prop);
                if errtemp<err
                    err=errtemp;
                    lambdaf=LAMBDA(i);
                    sigmaf=SIGMA(j);
                    muf=MU(k);
                end
            end
        end
    end
end



