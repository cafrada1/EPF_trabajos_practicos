P=0.2;
T_1=temperatura_encontrada(R,Tc(1),Pc(1),w(1),P,370);
T_2=temperatura_encontrada(R,Tc(2),Pc(2),w(2),P,400);
T_rocio=[];
T_burbuja=[];
z=[];
z(1)=0;
T_rocio(1)=T_2;
T_burbuja(1)=T_2;
for i=1:19
    z(i+1)=i*0.05;
    semilla_T=T_1*z(i+1)+T_2*(1-z(i+1));
    T_rocio(i+1)=temperatura_rocio(R,P,Tc,Pc,w,k,[z(i+1),1-z(i+1)],semilla_T);
    T_burbuja(i+1)=temperatura_burbuja(R,P,Tc,Pc,w,k,[z(i+1),1-z(i+1)],semilla_T);
end
z(length(z)+1)=1;
T_rocio(length(z))=T_1;
T_burbuja(length(z))=T_1;
figure
hold on;
plot(z,T_rocio,'r')
scatter(z,T_rocio,'filled','r')
scatter(z,T_burbuja,'filled','b')
plot(z,T_burbuja,'b')
xlabel("x,y");
ylabel("T (K)");
title("Diagrama T-x-y");
