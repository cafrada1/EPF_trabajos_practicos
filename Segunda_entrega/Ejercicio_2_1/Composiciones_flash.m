function [Error] = Composiciones_flash(Constantes,P,T,R,z1,...
    Coeficientes_antoine_1,Coeficientes_antoine_2,Parametros_gamma,Modelo)

P_sat_1=Presion_Antoine(Coeficientes_antoine_1,T);
P_sat_2=Presion_Antoine(Coeficientes_antoine_2,T);

[Gamma1,Gamma2]=NRTL(Parametros_gamma,Constantes(2),T,R);

Fracc_vapor=Constantes(1);

K1=P/(P_sat_1*Gamma1);

K2=P/(P_sat_2*Gamma2);

Error=((((K1-1)*z1)/(1+(K1-1)*Fracc_vapor)+((K2-1)*(1-z1))/(1+(K2-1)*Fracc_vapor)))^2;

x1=z1/(1+(K1-1)*Fracc_vapor);
y1=K1*z1/(1+(K1-1)*Fracc_vapor);
x2=(1-z1)/(1+(K2-1)*Fracc_vapor);
y2=K2*(1-z1)/(1+(K2-1)*Fracc_vapor);

[Gamma1,Gamma2]=NRTL(Parametros_gamma,x1,T,R);

Error=(P-(1-x2)*Gamma2*P_sat_2-x1*Gamma1*P_sat_1)^2;
end

