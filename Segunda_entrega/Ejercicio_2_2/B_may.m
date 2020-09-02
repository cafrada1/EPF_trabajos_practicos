function [valor] = B_may(R,T,Tc,P,Pc)
%{
    Recibe:
    R: constante de los gases
    T: Temperatura del sistema en kelvin
    Tc: Temperatura critica de la sustancia en kelvin
    P: Presion del sistema en Mpa
    Pc: Presion critica de la sustancia en Mpa

    Devuelve:
            valor: valor del parametro B de Peng-Robinson
%}
format long
valor=b_min(R,Tc,Pc)*P/(R*T);
end