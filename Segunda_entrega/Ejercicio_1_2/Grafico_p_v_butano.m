load('constantes_butano.mat')
P=[];
v_liquido=[];
v_vapor=[];
for i=1:15
    T=270+i*10;
    P_semilla=0.1+0.2*i;
    P(i)=presion_vapor_encontrada(R,Tc,Pc,w,T,P_semilla);
    v_liquido(i)= volumen_molar(R,Tc,Pc,w,T,P(i),0);
    v_vapor(i)= volumen_molar(R,Tc,Pc,w,T,P(i),1);
end
T=Tc-5;
P_semilla=Pc;
P(length(P)+1)=presion_vapor_encontrada(R,Tc,Pc,w,T,P_semilla);
v_liquido(length(P))= volumen_molar(R,Tc,Pc,w,T,P(length(P)),0);
v_vapor(length(P))= volumen_molar(R,Tc,Pc,w,T,P(length(P)),1);
figure
hold on;
plot(v_vapor,P,'r')
scatter(v_vapor,P,'filled','r')
plot(v_liquido,P,'b')
scatter(v_liquido,P,'filled','b')
title("P-v butano")
xlabel("v (cm^3/mol)")
ylabel("P (MPa)")
legend('Vapor saturado','Vapor saturado','Liquido saturado','Liquido saturado')