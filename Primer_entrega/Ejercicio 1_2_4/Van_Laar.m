function [Gamma1_teorico,Gamma2_teorico] = Van_Laar(Parametros,x1_experimental,T,R)

Gamma1_teorico=exp((Parametros(1).*(1+Parametros(1).*x1_experimental./(Parametros(2).*(1-x1_experimental))).^(-2))./(R*T));

Gamma2_teorico=exp((Parametros(2).*(1+Parametros(2).*(1-x1_experimental)./(Parametros(1).*x1_experimental)).^(-2))./(R*T));

end
