function [Gamma1_teorico,Gamma2_teorico] = Margules1(Parametros,x1_experimental,Temperatura,R)
%{
Recibe:
        Parametros (Array) : Constantes del modelo de margules a dos constantes.
        x1_experimental (Array) : Composiciones del componente 1 en el liquido.
        Temperatura (float) : Temperatura del sistema en kelvin.
        R (float) : Constante de los gases.
Devuelve:
        [Gamma1_teorico,Gamma2_teorico] (Array) : Coeficientes de actividad respectivos a las constantes del modelo. 
%}

Gamma1_teorico=exp((Parametros.*((1-x1_experimental).^2))./(R.*Temperatura));

Gamma2_teorico=exp((Parametros.*((x1_experimental).^2))./(R.*Temperatura));

end
