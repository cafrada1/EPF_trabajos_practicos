function [Gamma1_teorico,Gamma2_teorico] = NRTL(Parametros,x1_experimental,Temperatura,R)

t12=Parametros(2)./(R.*Temperatura);

t21=Parametros(3)./(R.*Temperatura);

G12=exp(-Parametros(1).*t12);

G21=exp(-Parametros(1).*t21);

Gamma1_teorico=exp((1-x1_experimental).^2.*(t21.*((G21)./((x1_experimental)+G21.*(1-x1_experimental))).^2+...
(t12.*G12./((1-x1_experimental)+G12.*(x1_experimental)).^2)));

Gamma2_teorico=exp((x1_experimental).^2.*(t12.*((G12)./((1-x1_experimental)+G12.*x1_experimental)).^2+...
(t21.*G21./(x1_experimental+G21.*(1-x1_experimental)).^2)));
end

