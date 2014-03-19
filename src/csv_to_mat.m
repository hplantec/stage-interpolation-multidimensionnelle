A = textread('arcepv3.csv','%s','whitespace',',','endofline','\n', 'headerlines',1);
B = reshape(A,13,2619)';

Names = B(:,1);
Names = regexprep(Names, 'Config (\d*)', '$1');
N = str2double(Names);

NbPann = B(:,2);
NbPann = regexprep(NbPann, '.*/(\d*)', '$1');
NbP = str2double(NbPann);

H = str2double(B(:,3));

P = str2double(B(:,4));

T2012 = str2double(B(:,5));

T2013 = str2double(B(:,6));

T2014 = str2double(B(:,7));

T2015 = str2double(B(:,8));

NSite = B(:,9);
NSite = regexprep(NSite, 'Site (\d*)', '$1');
NS = str2double(NSite);

RPRC = B(:,10);
RP = strcmp(RPRC, 'RP');
RC = strcmp(RPRC, 'RC');
Rpc = double(RP);
errs = find( (RP|RC) == 0 );
if errs
    fprintf('error with RPRC\n')
    errs
    Rpc(errs) = -1;
end

Date = B(:,11);
Date = datenum(Date);

ZoneVent = B(:,12);
VA = strcmp(ZoneVent, 'A');
VB = strcmp(ZoneVent, 'B');
V = double(VA);
errs = find( (VA|VB) == 0);
if errs
    fprintf('error with Zone vent\n');
    errs
    V(errs) = -1;
end

SiteRadio = B(:,13);
RadO = strcmp(SiteRadio, 'OUI');
RadN = strcmp(SiteRadio, 'NON');
Rad = double(RadO);
errs = find( (RadO|RadN) == 0 );
if errs
    fprintf('error with radio\n')
    errs
    Rad(errs) = -1;
end


X = zeros(size(B,1), 9);
X(:,1) = N;
X(:,2) = NbP;
X(:,3) = H;
X(:,4) = P;
X(:,5) = Rpc;
X(:,6) = V;
X(:,7) = Rad;
X(:,8) = Date;
X(:,9) = NS;

Y = zeros(size(B,1), 4);
Y(:,1) = T2012;
Y(:,2) = T2013;
Y(:,3) = T2014;
Y(:,4) = T2015;

save 'datav3.mat' X Y