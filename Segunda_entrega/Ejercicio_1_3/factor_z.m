function [z] = factor_z(R,T,Tc,P,Pc,w,semilla)
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
A=A_may(R,T,Tc,P,Pc,w);
B=B_may(R,T,Tc,P,Pc);

funcion=@(z)(z.^3-(1-B).*z.^2+(A-3*B^2-2*B).*z-(A*B-B^2-B^3));

z=raices_z(funcion,semilla);


end