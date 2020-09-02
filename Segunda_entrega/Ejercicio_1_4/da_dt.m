function [valor] = da_dt(R,T,Tc,Pc,w)
%{
    Recibe:
    R: constante de los gases
    T: Temperatura del sistema en kelvin
    Tc: Temperatura critica de la sustancia en kelvin
    Pc: Presion critica de la sustancia en Mpa
    w: factor acentrico de la sustancia

    Devuelve:
            valor: valor de la derivada de a respecto a la temperatura
%}
format long
alpha_compuesto=alpha(T,Tc,w);
k_compuesto=k(w);

valor=-0.45724*((R*T)^2)*k_compuesto*((alpha_compuesto/(T*Tc))^0.5)/Pc;
end