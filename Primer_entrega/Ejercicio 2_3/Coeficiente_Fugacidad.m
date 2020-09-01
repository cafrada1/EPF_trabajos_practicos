function [Phi] = Coeficiente_Fugacidad(P,T,R,B)

Phi=exp(P*B/(R*T));

end

