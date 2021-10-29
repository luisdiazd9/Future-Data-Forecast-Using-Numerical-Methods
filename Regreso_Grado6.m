%ingresamos los datos
X=xlsread('ProyectoDatos.xlsx','C2:C18');
x=sort(X.');
Y=xlsread('ProyectoDatos.xlsx','A2:A18');
y=Y.';

%hallamos los datos de nuestra matriz

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
i9=o1.*x;
i10=o1.*x;
i11=i10.*x;
i12=i11.*x;
o=sum(o1);
p=sum(i9);
q=sum(i10);
r=sum(i11);
s=sum(i12);
mul5=y.*h1;
b5=sum(mul5);
mul6=y.*k1;
b6=sum(mul6);

ma1=[f, e, d, c, b, h, k; 
   e, d, c, b, h, k, m; 
   d, c, b, h, k, m, o; 
   c, b, h, k, m, o, p; 
   b, h, k, m, o, p ,q; 
   h, k, m, o, p ,q, r; 
   k, m, o, p, q, r, s]
ma2=[a; g; j; l; na; b5; b6]

%GAUSS-JORDAN
C=[ma1 ma2]; 
for i=1:length(C(:,1)) 
if C(i,i)~=1 
    C(i,:)= C(i,:)./C(i,i); 
    disp(C)  
end
    for n=1:length(C(:,1)) 
      if n~=i 
          C(n,:)=-C(n,i).*C(i,:)+C(n,:); 
           disp(C)
      end
    end
end
RESP=C(:,8);
disp("Resultados: ")
disp(RESP)
a0=RESP(1);
a1=RESP(2);
a2=RESP(3);
a3=RESP(4);
a4=RESP(5);
a5=RESP(6);
a6=RESP(7);
yprom=mean(y);
y2=a0+a1*x+a2*x.^2+a3*x.^3+a4*x.^4+a5*x.^5+a6*x.^6;
sy2=sqrt((sum((y-yprom).^2))/(d-1));
sr2=sqrt((sum((y-y2).^2))/(d-2));
r2=(sy2-sr2)/sy2;
disp("r2:")
disp(r2)