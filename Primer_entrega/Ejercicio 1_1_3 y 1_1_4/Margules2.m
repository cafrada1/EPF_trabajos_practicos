function [Gamma1_teorico,Gamma2_teorico] = Margules2(Parametros,x1_experimental,Temperatura,R)
%{
Recibe:
        Parametros (Array) : Constantes del modelo de margules a dos constantes.
        x1_experimental (Array) : Composiciones del componente 1 en el liquido.
        Temperatura (float) : Temperatura del sistema en kelvin.
        R (float) : Constante de los gases.
Devuelve:
        [Gamma1_teorico,Gamma2_teorico] (Array) : Coeficientes de actividad respectivos a las constantes del modelo. 
%}

Gamma1_teorico=exp(((Parametros(1)+3*Parametros(2)).*((1-x1_experimental).^2)-...
    4*Parametros(2).*((1-x1_experimental).^3))./(R.*Temperatura));

Gamma2_teorico=exp(((Parametros(1)-3*Parametros(2)).*((x1_experimental).^2)+...
    4*Parametros(2).*((x1_experimental).^3))./(R.*Temperatura));

end
