%% The example of the Kernel_ridge_regression depending to sigma

Xtr=columnA;
Ytr=columnB;
Xte=transpose(735595 : 735650);
n=size(Xtr,1);
Ktrtr=rand(n,n);

lambda = 0.001;
mu=10;
for sigma = 2 : 0.1 : 4
    
    k=@(x,y) x*y + mu*exp(-(x-y)^2/(2*sigma^2));

    for i = 1 : n
        for j = 1 : n
            Ktrtr(i,j)=k(Xtr(i),Xtr(j));
        end
    end
    A= (Ktrtr+(lambda*n*eye(n)))\Ytr;
    m=size(Xte,1);
    Ktetr=rand(m,n);
    for i = 1 : m
        for j = 1 : n
            Ktetr(i,j)=k(Xte(i),Xtr(j));
        end
    end
    Yte=Ktetr*A;
    plot(Xtr,Ytr)
    hold on
    plot(Xte,Yte,'r')
    title(['sigma= ', num2str(sigma)])
    drawnow;
    pause;
    hold off
end