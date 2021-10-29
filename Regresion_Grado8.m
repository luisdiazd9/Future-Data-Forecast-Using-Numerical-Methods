%ingresamos los datos
X=xlsread('ProyectoDatos.xlsx','D2:D18');
x=sort(X.');
Y=xlsread('ProyectoDatos','A2:A18');
y=Y.';


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
i13=i12.*x;
i14=i13.*x;
i15=i14.*x;
i16=i15.*x;
o=sum(o1);
p=sum(i9);
q=sum(i10);
r=sum(i11);
s=sum(i12);
t=sum(i13);
u=sum(i14);
v=sum(i15);
w=sum(i16);
mul5=y.*h1;
b5=sum(mul5);
mul6=y.*k1;
b6=sum(mul6);
mul7=y.*m1;
b7=sum(mul7);
mul8=y.*o1;
b8=sum(mul8);

ma1=[f, e, d, c, b, h, k, m, o; 
   e, d, c, b, h, k, m, o, p; 
   d, c, b, h, k, m, o, p, q; 
   c, b, h, k, m, o, p, q, r; 
   b, h, k, m, o, p ,q, r, s; 
   h, k, m, o, p ,q, r, s, t; 
   k, m, o, p, q, r, s, t, u;
   m, o, p, q, r, s, t, u, v;
   o, p, q, r, s, t, u, v, w]
ma2=[a; g; j; l; na; b5; b6; b7; b8]

%GAUSS JORDAN

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
RESP=C(:,10);
disp("Resultados: ")
disp(RESP)
a0=RESP(1);
a1=RESP(2);
a2=RESP(3);
a3=RESP(4);
a4=RESP(5);
a5=RESP(6);
a6=RESP(7);
a7=RESP(8);
a8=RESP(9);
yprom=mean(y);
y2=a0+a1*x+a2*x.^2+a3*x.^3+a4*x.^4+a5*x.^5+a6*x.^6+a7*x.^7+a8*x.^8;
sy2=sqrt((sum((y-yprom).^2))/(d-1));
sr2=sqrt((sum((y-y2).^2))/(d-2));
r2=(sy2-sr2)/sy2;
disp("r2:")
disp(r2)