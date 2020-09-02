function [error] = Calcula_T(T,cons_entalpia,cons_vaporizacion,Tc,P,Pc,w,R,h_entrada)

lambda=h_vaporizacion(cons_vaporizacion,T,Tc);

h_vapor_salida=h_total(cons_entalpia,T,Tc,P,Pc,w,R,1);

h_liquido_salida=h_vapor_salida-lambda;

fracc_vap=(h_liquido_intermedia-h_liquido_evaporador)/h_vaporizacion(cons_vaporizacion,T_evaporador,Tc);

disp(fracc_ap)
error=abs(h_entrada-(h_vapor_salida*fracc_vap+h_liquido_salida*(1-fracc_vap)));

end

