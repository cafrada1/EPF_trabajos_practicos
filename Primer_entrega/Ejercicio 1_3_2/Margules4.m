function [Gamma1_teorico,Gamma2_teorico] = Margules4(Constantes,x1_experimental,Temperatura,R)

Gamma1_teorico=exp(((Constantes(1)+3*Constantes(2)+5*Constantes(3)+7*Constantes(4)).*(1-x1_experimental).^2-...
    (4*(Constantes(2)+4*Constantes(3)+9*Constantes(4)).*(1-x1_experimental).^3)+...
    (12*(Constantes(3)+5*Constantes(4)).*(1-x1_experimental).^4)-...
    (32*Constantes(4).*(1-x1_experimental).^5))./(R.*Temperatura));

Gamma2_teorico=exp(((Constantes(1)-3*Constantes(2)+5*Constantes(3)-7*Constantes(4)).*(x1_experimental).^2+...
    (4*(Constantes(2)-4*Constantes(3)+9*Constantes(4)).*(x1_experimental).^3)+...
    (12*(Constantes(3)-5*Constantes(4)).*(x1_experimental).^4)+...
    (32*Constantes(4).*(x1_experimental).^5))./(R.*Temperatura));
end

