clearvars
%%Datos
x=[0 2 2 4 4 6 6 2 1];
y=[14 21 11 12 23 23 14 6 11];


%%Se definen los datos de la matriz
a=sum(y);
b1=x.*x;
b=sum(b1);
c=sum(x);
d=length(x);
e1=x.*y;
e=sum(e1);
f1=x.*x.*x;
f=sum(f1);
g1=b1.*y;
g=sum(g1);
h1=x.*x.*x.*x;
h=sum(h1);

%%Se organiza la matriz
ma1=[d, c, b;c, b, f; b, f, h];
ma2=[a; e; g];

%%Se resuelve el sistema
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
RESP=C(:,4);
disp("Resultados: ")
disp(RESP)
a0=RESP(1);
a1=RESP(2);
a2=RESP(3);
yprom=mean(y);
y2=a0+a1*(x)+a2*(x.^2);
sy2=sqrt((sum((y-yprom).^2))/(d-1));
sr2=sqrt((sum((y-y2).^2))/(d-2));
r2=(sy2-sr2)/sy2;
disp("r2:")
disp(r2)
