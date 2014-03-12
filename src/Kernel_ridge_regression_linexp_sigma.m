%% The example of the Kernel_ridge_regression_linexp depending on sigma

function[] = Kernel_ridge_regression_linexp_sigma (Xtr , Ytr , Xte , lambda ,sigmamin , sigmamax , mu)

n=size(Xtr,1);

for sigma = sigmamin : (sigmamax-sigmamin)/20 : sigmamax
    
    k=@(x,y) x*y' + mu*exp(-(x*ones(1,size(y,1))-ones(size(x,1),1)*y').^2/(2*sigma^2));

    Ktrtr=k(Xtr,Xtr);
    A=(Ktrtr+(lambda*n*eye(n)))\Ytr;
    Ktetr=k(Xte,Xtr);
    Yte=Ktetr*A;
    
    scatter(Xtr,Ytr)
    hold on
    plot(Xte,Yte,'r')
    title(['lamba= ', num2str(lambda)])
    drawnow;
    pause;
    hold off
end