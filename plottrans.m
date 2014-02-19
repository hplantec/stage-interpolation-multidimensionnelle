function a= plottrans()
p=inputParser;


defaultcoef=0.1;
defaultlim=0.1;

defaultcriterium='hauteur';
expectedcriterium={'panneaux','hauteur','puissance','RC/RP','sites','dates'};

defaultreference='average';
expectedreference={'average','most'};

defaultyear=1;
%defaultnoise=0;


addOptional(p,'coef',defaultcoef,@isnumeric);
addOptional(p,'lim',defaultlim,@isnumeric);
addParameter(p,'criterium',defaultcriterium);
addParameter(p,'reference',defaultreference);
addOptional(p,'year',@isnumeric);
%addOptional(p,'noise',@isnumeric);

parse(p,criterium,varargin{:});
parse(p,coef,varargin{:});
parse(p,lim,varargin{:});
parse(p,reference,varargin{:});
parse(p,year,varargin{:});

Xn=zscore(X);

if p.Results.reference='average'
    for i=1:2614
Xm(i,1:7)=[Xn(i,1) 0 0 0 Xn(i,5) Xn(i,6) 0];
    end
end
if reference='most'
    for i=1:2614
        Xm(i,1:7)=[Xn(i,1) -0.4533 -1.1313 -0.0934 Xn(i,5) Xn(i,6) 0.2193];
    end
end

if criterium='hauteur'
    c=3;
        Xm(:,3)=Xn(:,3);
end
if criterium='panneaux'
    c=2;
        Xm(:,2)=Xn(:,2);
end
if criterium='puissance'
    c=4;
        Xm(:,4)=Xn(:,4);
end
if criterium='RC/RP'
    c=5;
        Xm(:,5)=Xn(:,5);
end
if criterium='sites'
    c=6;
        Xm(:,6)=Xn(:,6);
end
if criterium='dates'
    c=7;
        Xm(:,7)=Xn(:,7);
end

if year<=1;
    y=year;
end
if year>=2012 & year<=2015
    y=year-2011;
end

Xgraphe=[];
Ygraphe=[];


for i=1:2614
    T(i,1)=sum((Xm(i,:)-Xn(i,:)).^2);
    if T(i,1)>=lim
Xgraphe(size(Xgraphe,1)+1,1)=X(i,c);
Ygraphe(size(Ygraphe,1)+1,1)=Y(i,y);
    end
end

figure(1);
clf;
z=ones(4,1);
patch(0,0,1);

hold on

for i=1:size(X2,1)
    xC=X2(i,c);
    yC=Y(i,y);
    x =[xC-1;xC;xC+1;xC];
    y =[yC;yC-100;yC;yC+100];
    p=patch(x,y,z,'b','EdgeColor','none');
    set(p,'FaceAlpha',T(i,1));
end

title('ref mean');
xlabel('hauteur');
ylabel('prix');

hold off

