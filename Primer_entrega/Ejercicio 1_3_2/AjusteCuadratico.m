function [Error] = AjusteCuadratico(Constantes,G1,G2,x1_experimental,T,R,Presiones,Presiones_Saturacion,valor_a_ajustar,Modelo)
%{
Recibe:
        Constantes (Array) : Constantes de Margules.
        G1 (Array) : Los coeficientes de actividad experimentales del compuesto 1.
        G2 (Array) : Los coeficientes de actividad experimentales del compuesto 2.
        x1_experimental (Array) : Las composiciones en el liquido del componente 1.
        T (float) : Temperatura del sistema en kelvin.
        R (float) : Constante de los gases.
        Presiones (Array) : Las presiones del sistema.
        Presiones_Saturacion (Arrat) : Presion de saturacion del componente 1 y el componente 2 respectivamente.
        valor_a_ajustar (string) : define el parametro sobre el que se realiza el ajuste.
Devuelve:
        Error (float) : El error absoluto entre los valores experimentales y los calculados con las constantes del modelo.  
%}

%Calculo los coeficientes de activadad correspondientes a las constantes.
switch Modelo
    
    case "Margules4"

        [G1_teorico,G2_teorico]=Margules4(Constantes,x1_experimental,T,R);

    case "NRTL"

        [G1_teorico,G2_teorico]=NRTL(Constantes,x1_experimental,T,R);

end

Error=sum(abs(Presiones-...
    (x1_experimental.*G1_teorico*Presiones_Saturacion(1)+...
    (1-x1_experimental).*G2_teorico*Presiones_Saturacion(2))).^2);



end
