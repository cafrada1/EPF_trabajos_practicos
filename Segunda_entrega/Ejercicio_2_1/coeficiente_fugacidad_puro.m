function [coeficiente] = coeficiente_fugacidad_puro(R,T,Tc,P,Pc,w,z0)

z=factor_z_puro(R,T,Tc,P,Pc,w,z0);

B=B_may(R,T,Tc,P,Pc);

A=A_may(R,T,Tc,P,Pc,w);

coeficiente=exp(z-1-log(z-B)-...
    (A*log((z+B*(1+2^0.5))/(z+B*(1-2^0.5))))/(B*8^0.5));

end

