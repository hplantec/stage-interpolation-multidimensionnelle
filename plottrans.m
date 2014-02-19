function a= plottrans(varargin)
load datav2.mat

p=inputParser;


defaultcoef=0.1;
defaultlim=0.1;

defaultcriterium='hauteur';
expectedcriterium={'panneaux','hauteur','puissance','RC/RP','sites','dates'};

defaultreference='mean';
expectedreference={'mean','most'};

defaultyear=1;
%defaultnoise=0;


addOptional(p,'coef',defaultcoef,@isnumeric);
addOptional(p,'lim',defaultlim,@isnumeric);
addParamValue(p,'criterium',defaultcriterium);
addOptional(p,'year',defaultyear,@isnumeric);
%addOptional(p,'noise',@isnumeric);
addOptional(p,'reference',defaultreference,@(x) any(validatestring(x,expectedreference)));

parse(p,varargin{:});

Xn=zscore(X);

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
end
if isequal(p.Results.criterium,'panneaux')==1
    c=2;
        Xm(:,2)=Xn(:,2);
end
if isequal(p.Results.criterium,'puissance')==1
    c=4;
        Xm(:,4)=Xn(:,4);
end
if isequal(p.Results.criterium,'RC/RP')==1
    c=5;
        Xm(:,5)=Xn(:,5);
end
if isequal(p.Results.criterium,'sites')==1
    c=6;
        Xm(:,6)=Xn(:,6);
end
if isequal(p.Results.criterium,'dates')==1
    c=7;
        Xm(:,7)=Xn(:,7);
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

figure(1);
clf;
z=ones(4,1);
patch(0,0,1);

hold on

for i=1:size(Xgraphe,1)
    xC=Xgraphe(i,1);
    yC=Ygraphe(i,1);
    x =[xC-1;xC;xC+1;xC];
    y =[yC;yC-100;yC;yC+100];
    p=patch(x,y,z,'b','EdgeColor','none');
    set(p,'FaceAlpha',T(i,1));
end

title('ref mean');
xlabel('hauteur');
ylabel('prix');

hold off

