function [error] = ajuste_temperatura(T,P,R,Tc,Pc,w)

[phi_vapor,phi_liquido]=coeficiente_fugacidad_puro(R,T,Tc,P,Pc,w);

error=phi_vapor-phi_liquido;

end


