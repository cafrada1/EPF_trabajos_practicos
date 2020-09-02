
s_entrada=s_total(cons_entalpia,T_evaporador,Tc,presion_vapor_evaporador,Pc,w,R,1);

s_salida_ideal=@(T)s_total(cons_entalpia,T,Tc,presion_vapor_condensador,Pc,w,R,1);

T_salida_ideal=raices_z(@(T)abs(s_entrada-s_salida_ideal(T)),T_s_condensador);

h_entrada=h_total(cons_entalpia,T_evaporador,Tc,presion_vapor_evaporador,Pc,w,R,1);

h_salida_ideal=h_total(cons_entalpia,T_salida_ideal,Tc,presion_vapor_condensador,Pc,w,R,1);

W_ideal=h_salida_ideal-h_entrada;

W_real=W_ideal/rendimiento;

h_salida_real=W_real+h_entrada;


h_salida=@(T_s)h_total(cons_entalpia,T_s,Tc,presion_vapor_condensador,Pc,w,R,1);

T_s_real=raices_z(@(T)abs(h_salida(T)-h_salida_real),T_salida_ideal);

W=h_salida(T_s_real)-h_entrada;

