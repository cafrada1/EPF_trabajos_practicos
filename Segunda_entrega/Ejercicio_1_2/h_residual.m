function [h_residual] = h_residual(R,T,Tc,P,Pc,w,z0)
%{
    Recibe:
    R: constante de los gases
    T: Temperatura del sistema en kelvin
    Tc: Temperatura critica de la sustancia en kelvin
    P: Presion del sistema en Mpa
    Pc: Presion critica de la sustancia en Mpa
    w: factor acentrico de la sustancia

    Devuelve:
            h_r_liquido: entalpia residual del liquido del sistema en las condiciones del sistema
            h_r_vapor: entalpia residual del vapor del sistema en las condiciones del sistema
%}
z=factor_z(R,T,Tc,P,Pc,w,z0);

a_compuesto=a_min(R,T,Tc,Pc,w);

da_dt_compuesto=da_dt(R,T,Tc,Pc,w);

b_compuesto=b_min(R,Tc,Pc);

B_compuesto=B_may(R,T,Tc,P,Pc);

h_residual=R*T*(z-1)+...
log((z+(1+2^0.5)*B_compuesto)/(z+(1-2^0.5)*B_compuesto))*...
(da_dt_compuesto*T-a_compuesto)/(b_compuesto*8^0.5);

end