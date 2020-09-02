function [valor] = a_min(R,T,Tc,Pc,w)
%{
    Recibe:
    R: constante de los gases
    T: Temperatura del sistema en kelvin
    Tc: Temperatura critica de la sustancia en kelvin
    Pc: Presion critica de la sustancia en Mpa
    w: factor acentrico de la sustancia

    Devuelve:
            valor: valor del parametro a de Peng-Robinson
%}
format long
valor=0.45724*((R*Tc)^2)*alpha(T,Tc,w)/Pc;
end