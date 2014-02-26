function nerienafficher= plottrans(varargin)
load datav2.mat


%On pourrait éventuellement rajouter une option pour mettre du
%bruit...

p=inputParser;


defaultcoef=0.1;
defaultlim=0.1;
defaultfigure=1;
defaultsize=0.02;

defaultcriterium='hauteur';
expectedcriterium={'panneaux','hauteur','puissance','RC/RP','sites','dates'};

defaultreference='mean';
expectedreference={'mean','most'};

defaultyear=1;
%defaultnoise=0;

addOptional(p,'size',defaultsize,@isnumeric);
addOptional(p,'figure',defaultfigure,@isnumeric);
addOptional(p,'coef',defaultcoef,@isnumeric);
addOptional(p,'lim',defaultlim,@isnumeric);
addParamValue(p,'criterium',defaultcriterium);
addOptional(p,'year',defaultyear,@isnumeric);
%addOptional(p,'noise',@isnumeric);
addOptional(p,'reference',defaultreference,@(x) any(validatestring(x,expectedreference)));

parse(p,varargin{:});

siz=p.Results.size;
Xn=zscore(X);
figure(p.Results.figure);
clf;
a=p.Results.criterium;
abcd=p.Results.reference;

if p.Results.reference=='mean'
    for i=1:2614
Xm(i,1:7)=[Xn(i,1) 0 0 0 Xn(i,5) Xn(i,6) 0];
    end
end

if p.Results.reference=='most'
    for i=1:2614
        Xm(i,1:7)=[Xn(i,1) -0.4533 -1.1313 -0.0934 Xn(i,5) Xn(i,6) 0.2193];
    end
end

if isequal(p.Results.criterium,'hauteur')==1
    c=3;
        Xm(:,3)=Xn(:,3);
        xlabel('hauteur');
end
if isequal(p.Results.criterium,'panneaux')==1
    c=2;
        Xm(:,2)=Xn(:,2);
        xlabel('panneaux');
end
if isequal(p.Results.criterium,'puissance')==1
    c=4;
        Xm(:,4)=Xn(:,4);
        xlabel('puissance');
end
if isequal(p.Results.criterium,'RC/RP')==1
    c=5;
        Xm(:,5)=Xn(:,5);
        xlabel('RC/RP');
end
if isequal(p.Results.criterium,'sites')==1
    c=6;
        Xm(:,6)=Xn(:,6);
        xlabel('sites');
end
if isequal(p.Results.criterium,'dates')==1
    c=7;
        Xm(:,7)=Xn(:,7);
        xlabel('dates');
end

if p.Results.year<=4;
    y=p.Results.year;
elseif p.Results.year>=2012 & p.Results.year<=2015
    y=p.Results.year-2011;
end

Xgraphe=[];
Ygraphe=[];


for i=1:2614
    T(i,1)=exp(-sum((Xm(i,:)-Xn(i,:)).^2)/p.Results.coef);
    if T(i,1)>=p.Results.lim
Xgraphe(size(Xgraphe,1)+1,1)=X(i,c);
Ygraphe(size(Ygraphe,1)+1,1)=Y(i,y);
    end
end

figure(p.Results.figure);
clf;
z=ones(4,1);
patch(0,0,1);

hold on

xC=[];
yC=[];

for i=1:size(Xgraphe,1)
    xC(size(xC,1)+1,1)=Xgraphe(i,1);
    yC(size(yC,1)+1,1)=Ygraphe(i,1);
end


for i=1:size(xC,1)
    e(1,1)=(max(xC)-min(xC))*siz;
    e(2,1)=(max(yC)-min(yC))*siz;
    x =[xC(i,1)-e(1,1)/2;xC(i,1)-e(1,1)/2;xC(i,1)+e(1,1)/2;xC(i,1)+e(1,1)/2];
    y =[yC(i,1)+e(2,1)/2;yC(i,1)-e(2,1)/2;yC(i,1)-e(2,1)/2;yC(i,1)+e(2,1)/2];
    p=patch(x,y,z,'b','EdgeColor','none');
    set(p,'FaceAlpha',T(i,1));
end

axis([min(xC)-e(1,1)/(10*siz) max(xC)+e(1,1)/(10*siz) min(yC)-e(2,1)/(10*siz) max(yC)+e(2,1)/(10*siz)])

 if isequal(a,'hauteur')==1
    xlabel('hauteur');
end
if isequal(a,'puissance')==1
    xlabel('puissance');
end
if isequal(a,'panneaux')==1
    xlabel('panneaux');
end
if isequal(a,'sites')==1
    xlabel('sites');
end
if isequal(a,'RC/RP')==1
    xlabel('RC/RP');
end
if isequal(a,'dates')==1
    xlabel('dates');
end

if abcd=='mean'
    title('ref mean');
end
if abcd=='most'
    title('ref most');
end

ylabel('prix');

hold off

