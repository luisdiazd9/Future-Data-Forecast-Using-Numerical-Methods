x1=xlsread('ProyectoDatos.xlsx','A2:A27');
x=sort(x1.');
y1=xlsread('ProyectoDatos.xlsx','B2:G27');
y=y1.';
a=sum(y);
b1=x.*x.*x.*x.*x;
b=sum(b1);
c1=x.*x.*x.*x;
c=sum(c1);
d1=x.*x.*x;
d=sum(d1);
e1=x.*x;
e=sum(e1);
f=sum(x);
g=length(x);
h1=x.*y;
h=sum(h1);
j1=b1.*x;
j=sum(j1);
k1=e1.*y;
k=sum(k1);
l1=j1.*x;
l=sum(l1);
m1=d1.*y;
m=sum(m1);
o1=l1.*x;
o=sum(o1);
p1=c1.*y;
p=sum(p1);
q1=o1.*x;
q=sum(q1);
r1=b1.*y;
r=sum(r1);
s1=q1.*x;
s=sum(s1);
ma1=[g, f, e, d, c, b; f, e, d, c, b, j; e, d, c, b, j, l; d, c, b, j, l, o; c, b, j, l, o, q; b, j, l, o, q, s]
ma2=[a; h; k; m; p; r]
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
RESP=C(:,7);
disp("Resultados: ")
disp(RESP)
a0=RESP(1);
a1=RESP(2);
a2=RESP(3);
a3=RESP(4);
a4=RESP(5);
a5=RESP(6);
yprom=mean(y);
y2=a0+a1*x+a2*x.^2+a3*x.^3+a4*x.^4+a5*x.^5;
sy2=sqrt((sum((y-yprom).^2))/(d-1));
sr2=sqrt((sum((y-y2).^2))/(d-2));
r2=(sy2-sr2)/sy2;
disp("r2:")
disp(r2)