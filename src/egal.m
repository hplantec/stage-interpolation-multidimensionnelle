function[k]= egal(p,X,Y)
%% X and Y must be define
%first argument p is the quotient max(price)/min(price)
% the second one is X and the third one Y
% the function egal return each set of indices having same values of
% criters but different prices, and then the numbers of these sets
M1=unique(X(:,1));
M2=unique(X(:,2));
M3=unique(X(:,3));
M4=unique(X(:,4));
M5=unique(X(:,5));
n1=size(M1);
n2=size(M2);
n3=size(M3);
n4=size(M4);
n5=size(M5);
k=0;
for i1=1:n1
    L1=X(:,1)==M1(i1,1);
    A1=X(L1,:);
    B1=Y(L1,:);
    if size(A1,1)>1
        for i2=1:n2
            L2=A1(:,2)==M2(i2,1);
            A2=A1(L2,:);
            B2=B1(L2,:);
            if size(A2,1)>1
                for i3=1:n3
                    L3=A2(:,3)==M3(i3,1);
                    A3=A2(L3,:);
                    B3=B2(L3,:);
                    if size(A3,1)>1
                        for i4=1:n4
                            L4=A3(:,4)==M4(i4,1);
                            A4=A3(L4,:);
                            B4=B3(L4,:);
                            if size(A4,1)>1
                                for i5=1:n5
                                    L5=A4(:,5)==M5(i5,1);
                                    A5=A4(L5,:);
                                    B5=B4(L5,:);
                                    if max(B5)/min(B5)>p
                                        k=k+1;
                                        find(X(:,1)==A5(1,1) & X(:,2)==A5(1,2) & X(:,3)==A5(1,3) & X(:,4)==A5(1,4) & X(:,5)==A5(1,5))
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end