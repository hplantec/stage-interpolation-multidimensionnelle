%% The example of the Kernel_ridge_regression_linexp depending on lambda

function[] = Kernel_ridge_regression_linexp_lambda (Xtr , Ytr , Xte , lambdamin , lambdamax ,sigma , mu)

n=size(Xtr,1);

for lambda = lambdamin : (lambdamax-lambdamin)/20 : lambdamax
    
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