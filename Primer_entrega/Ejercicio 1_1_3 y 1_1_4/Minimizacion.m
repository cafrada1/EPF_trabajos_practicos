function [x,fval] = Minimizacion(funcion_recibida,x0,lb,ub)

%{
Recibe:
        funcion_recibida (function) : Funcion que debe ser ajustada.
        x0 (float o Array) : Valores semilla.
        lb (float o Array) : Valores minimos.
        ub (float o Array) : Valores maximos.
Devuelve:
        [x,fval] (Array) : Valor que minimiza a la funcion entre los
        limites lb y ub junto con el valor de la funcion en dicho valor.
%}
    
options = optimoptions('fmincon');

options = optimoptions(options,'Display', 'off');

[x,fval,exitflag,output,lambda,grad,hessian] = fmincon(funcion_recibida,x0,[],[],[],[],lb,ub,[],options);

