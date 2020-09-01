function [x,fval] = Minimizacion(funcion,x0)

[x,fval,exitflag,output] = fminsearch(@(valor)funcion(valor),x0);
