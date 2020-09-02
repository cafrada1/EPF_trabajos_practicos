function [valor] = A_may(R,T,Tc,P,Pc,w)
%{
    Recibe:
    R: constante de los gases
    T: Temperatura del sistema en kelvin
    Tc: Temperatura critica de la sustancia en kelvin
    P: Presion del sistema en Mpa
    Pc: Presion critica de la sustancia en Mpa
    w: factor acentrico de la sustancia

    Devuelve:
            valor: valor del parametro A de Peng-Robinson
%}
format long
valor=a_min(R,T,Tc,Pc,w)*P/(R*T)^2;
end