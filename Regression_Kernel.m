clear all
load('data.mat')
L= X(:,2)==2 & X(:,5)==1;
Xi= X(L,4);
Yi= X(L,3);
Zi= Y(L,4);
for i =1 : 4131
    x(i)=floor((i-1)/81);
    y(i)=(i-1) - 81*x(i);
end
x=transpose(x);
y=transpose(y);
scatter3(Xi, Yi, Zi)
hold on
g=@(a,b) sum(Zi.*exp(((Xi-a).*(a-Xi)+(Yi-b).*(b-Yi))/2))/sum(exp(((Xi-a).*(a-Xi)+(Yi-b).*(b-Yi))/2));
n=size(x);
for j=1 : n
    z(j)=g(x(j),y(j));
end
scatter3(x,y,z,10,'r')
hold off