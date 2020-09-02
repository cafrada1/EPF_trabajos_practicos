function [valor] = k(w)
%{
    Recibe:
    w: factor acentrico de la sustancia

    Devuelve:
            valor: valor del parametro k de Peng-Robinson
%}
format long
valor=0.37464+1.5422*w-0.26992*w^2;
end
    