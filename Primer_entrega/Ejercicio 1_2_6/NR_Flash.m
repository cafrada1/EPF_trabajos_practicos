function [Datos] = NR_Flash(P,T,R,z1,Coeficientes_antoine_1,Coeficientes_antoine_2,Parametros_gamma,Modelo)

x1=z1;
y1=z1;
Fracc_vapor=0.5;

P_sat_1=Presion_Antoine(Coeficientes_antoine_1,T);
P_sat_2=Presion_Antoine(Coeficientes_antoine_2,T);


Error_fracc=10;
Error_x=10;
Error_y=10;
format long
while max([Error_fracc,Error_x,Error_y])>1e-5
    
    [Gamma1,Gamma2]=NRTL(Parametros_gamma,x1,T,R);
    
    K1=(P_sat_1*Gamma1)/P;

    K2=(P_sat_2*Gamma2)/P;
    
    f_fracc=((K1-1)*z1)/(1+(K1-1)*Fracc_vapor)+((K2-1)*(1-z1))/(1+(K2-1)*Fracc_vapor);
    
    f_prima_fracc=((K1-1)^2*(z1))/(1+(K1-1)*Fracc_vapor)^2+((K2-1)^2*(1-z1))/(1+(K2-1)*Fracc_vapor)^2;
    
    Fracc_vapor=Fracc_vapor+f_fracc/f_prima_fracc;
    
    x1=z1/(1+(K1-1)*Fracc_vapor);
   
    y1=K1*z1/(1+(K1-1)*Fracc_vapor);
    
    Error_fracc=abs(f_fracc/f_prima_fracc);
    
    Error_x=abs(x1-z1/(1+(K1-1)*Fracc_vapor));
    
    Error_y=(y1-K1*z1/(1+(K1-1)*Fracc_vapor));
    if Fracc_vapor>1
        Fracc_vapor=1;
        y1=z1;
        x1=0;
        break
    elseif Fracc_vapor<0
        Fracc_vapor=0;
        x1=z1;
        y1=0;
        break
    end
end
Datos=[Fracc_vapor,x1,y1];
end

