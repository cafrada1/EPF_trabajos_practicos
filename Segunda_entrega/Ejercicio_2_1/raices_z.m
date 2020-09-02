function [x,fval] = raices_z(funcion,x0)
format long
%warning('off','all')
options = optimoptions('fsolve');

options = optimoptions(options,'Display', 'off');

options = optimoptions(options,'MaxFunctionEvaluations', 6000);
options = optimoptions(options,'MaxIterations', 6000);
options = optimoptions(options,'FunctionTolerance',1e-20);
options = optimoptions(options,'StepTolerance', 1e-20);

[x,fval,exitflag,output,jacobian] = fsolve(funcion,x0,options);

end