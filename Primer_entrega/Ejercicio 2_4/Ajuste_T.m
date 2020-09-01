function [Error] = Ajuste_T(T,Compuesto1,Compuesto2,Param_1,Param_2,Param_12,P,R,kb,y1,Entropia_entrada)

B_T_s=Derivada_B_mezcla(Param_1,Param_2,Param_12,T,kb,y1,Compuesto1,Compuesto2);

Entropia_Ideal_mezcla_salida=Entropia_Ideal(Compuesto1,T,R,P)*y1+...
    Entropia_Ideal(Compuesto2,T,R,P)*(1-y1)-y1*R*log(y1)-(1-y1)*R*log(1-y1);

Error=abs(-Entropia_entrada+Entropia_Ideal_mezcla_salida-Entropia_Residual(P,B_T_s));


end

