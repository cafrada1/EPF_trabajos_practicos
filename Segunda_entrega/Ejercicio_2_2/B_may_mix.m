function [valor] = B_may_mix(R,T,Tc,P,Pc,composicion)
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
valor=b_mix(R,Tc,Pc,composicion)*P/(R*T);
end