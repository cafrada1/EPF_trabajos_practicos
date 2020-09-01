function [x,fval] = Minimizacion(funcion,x0)
options = optimset;
options = optimset(options,'MaxFunEvals', 5000);
options = optimset(options,'MaxIter', 5000);
options = optimset(options,'TolFun', 1e-10);
options = optimset(options,'TolX', 1e-10);
[x,fval,exitflag,output] = fminsearch(@(valor)funcion(valor),x0,options);
