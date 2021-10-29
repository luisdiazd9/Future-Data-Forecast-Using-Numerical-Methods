%ingresamos los datos
x1=xlsread('ProyectoDatos.xlsx','A2:A18');
x=sort(x1.');
y1=xlsread('ProyectoDatos.xlsx','B2:B18');
y=y1.';

a=sum(y);
b1=x.*x.*x.*x;
b=sum(b1);
c1=x.*x.*x;
c=sum(c1);
d1=x.*x;
d=sum(d1);
e=sum(x);
f=length(x);
g1=x.*y;
g=sum(g1);
h1=b1.*x;
h=sum(h1);
j1=d1.*y;
j=sum(j1);
k1=h1.*x;
k=sum(k1);
l1=c1.*y;
l=sum(l1);
m1=k1.*x;
m=sum(m1);
n1=b1.*y;
na=sum(n1);
o1=m1.*x;
o=sum(o1);

m1=[f, e, d, c, b; 
   e, d, c, b, h; 
   d, c, b, h, k; 
   c, b, h, k, m; 
   b, h, k, m, o]

m2=[a; g; j; l; na]

%Gauss-Jordan
C=[m1 m2]; 
for i=1:length(C(:,1)) 
if C(i,i)~=1 
    C(i,:)= C(i,:)./C(i,i); 
    disp(C)   
end
    for n=1:length(C(:,1)) %
      if n~=i 
          C(n,:)=-C(n,i).*C(i,:)+C(n,:); %entonces se convierte a 0 
           disp(C)
      end
    end
end
RESP=C(:,6);
disp("Resultados: ")
disp(RESP)
a0=RESP(1);
a1=RESP(2);
a2=RESP(3);
a3=RESP(4);
a4=RESP(5);
yprom=mean(y);
y2=a0+a1*x+a2*x.^2+a3*x.^3+a4*x.^4;
sy2=sqrt((sum((y-yprom).^2))/(d-1));
sr2=sqrt((sum((y-y2).^2))/(d-2));
r2=(sy2-sr2)/sy2;
disp("r2:")
disp(r2)
