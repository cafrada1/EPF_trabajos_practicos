function [valor] = b_min(R,Tc,Pc)
%{
    Recibe:
    R: constante de los gases
    Tc: Temperatura critica de la sustancia en kelvin
    Pc: Presion critica de la sustancia en Mpa

    Devuelve:
            valor: valor del parametro b de Peng-Robinson
%}
format long
valor=0.077796*R*Tc/Pc;
end