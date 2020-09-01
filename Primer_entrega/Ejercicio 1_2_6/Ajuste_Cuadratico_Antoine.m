function [Error] = Ajuste_Cuadratico_Antoine(Constantes,T,Presiones_Saturacion_Experimental)
%{
Recibe:
        Constantes (Array) : Constantes de Margules.  
        T (float) : Temperatura del sistema en kelvin.
Devuelve:
%}

Presion_Calculada=Presion_Antoine(Constantes,T);

Error=sum((Presiones_Saturacion_Experimental-Presion_Calculada).^2);

end
