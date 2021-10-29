%%Datos
clearvars
x=[0 2 2 4 4 6 6 2 1];
y=[14 21 11 12 23 23 14 6 11];

a=sum(y);
b=length(x);
c=sum(x);
d1=x.*y;
d=sum(d1);
f1=x.*x;
f=sum(f1);
m1=[b, c; c, f];
m2=[a;d];
S=m1\m2;
inter=S(1);
pend=S(2);
yprom=mean(y);
y2=inter+pend*x; %% Fórmula de la regresion
sy2=sqrt((sum((y-yprom).^2))/(d-1));
sr2=sqrt((sum((y-y2).^2))/(d-2));
r2=(sy2-sr2)/sy2;
