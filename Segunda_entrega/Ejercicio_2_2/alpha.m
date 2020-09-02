function [valor] = alpha(T,Tc,w)
%{
    Recibe:
    T: Temperatura del sistema en kelvin
    Tc: Temperatura critica de la sustancia en kelvin
    w: factor acentrico de la sustancia

    Devuelve:
            valor: valor del parametro alpha de Peng-Robinson
%}
format long
valor=(1+k(w)*(1-(T/Tc)^0.5))^2;
end

