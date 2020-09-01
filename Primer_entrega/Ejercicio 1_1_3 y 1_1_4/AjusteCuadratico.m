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
    case "Margules1"

        [G1_teorico,G2_teorico]=Margules1(Constantes,x1_experimental,T,R);
    case "Margules2"

        [G1_teorico,G2_teorico]=Margules2(Constantes,x1_experimental,T,R);

    case "Wilson"

        [G1_teorico,G2_teorico]=Wilson(Constantes,x1_experimental);

    case "Van Laar"

        [G1_teorico,G2_teorico]=Van_Laar(Constantes,x1_experimental,T,R);

    case "NRTL"

        [G1_teorico,G2_teorico]=NRTL(Constantes,x1_experimental,T,R);

end

%Definicion de caso y calculo del error absoluto entre ambos los valores calculados y los experimentales.
switch valor_a_ajustar
       
    case "Gamma"
        
        Error=sum((G1-G1_teorico).^2+(G2-G2_teorico).^2);
       
    case "P_Burbuja"

        Error=sum(abs(Presiones-...
            (x1_experimental.*G1_teorico*Presiones_Saturacion(1)+...
            (1-x1_experimental).*G2_teorico*Presiones_Saturacion(2))).^2);
        
    case "G_exceso"
        
        Error=sum((x1_experimental.*(log(G1)-log(G1_teorico))).^2+((1-x1_experimental).*(log(G2)-log(G2_teorico))).^2);

end
end
