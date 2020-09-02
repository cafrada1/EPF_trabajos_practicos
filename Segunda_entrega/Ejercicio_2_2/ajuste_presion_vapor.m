function [error] = ajuste_presion_vapor(P,T,R,Tc,Pc,w)

phi_vapor=coeficiente_fugacidad_puro(R,T,Tc,P,Pc,w,1);
phi_liquido=coeficiente_fugacidad_puro(R,T,Tc,P,Pc,w,0);

error=phi_vapor-phi_liquido;

end

