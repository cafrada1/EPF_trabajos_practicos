
s_entrada_baja=s_total(cons_entalpia,T_evaporador,Tc,presion_vapor_evaporador,Pc,w,R,1);

s_salida_baja_ideal=@(T)s_total(cons_entalpia,T,Tc,presion_intermedia,Pc,w,R,1);

T_salida_ideal=raices_z(@(T)abs(s_entrada_baja-s_salida_baja_ideal(T)),T_intermedia);

h_salida_baja_ideal=h_total(cons_entalpia,T_salida_ideal,Tc,presion_intermedia,Pc,w,R,1);

W_baja_ideal=h_salida_baja_ideal-h_vapor_evaporador;

W_baja_real=W_baja_ideal/rendimiento;

h_salida_baja_real=W_baja_real+h_vapor_evaporador;

h_salida_baja=@(T_s)h_total(cons_entalpia,T_s,Tc,presion_intermedia,Pc,w,R,1);

T_s_baja_real=raices_z(@(T)abs(h_salida_baja(T)-h_salida_baja_real),T_salida_ideal);

Potencia_compresor_baja=W_baja_real*caudal_compresor_baja;

func=@(T)abs(h_total(cons_entalpia,T,Tc,presion_intermedia,Pc,w,R,1)-...
    ((1-fracc_vap_alta)*h_salida_baja_real+fracc_vap_alta*h_vapor_intermedia));

T_e_alta=raices_z(func,T_s_baja_real);

h_entrada_alta=h_total(cons_entalpia,T_e_alta,Tc,presion_intermedia,Pc,w,R,1);

s_entrada_alta=s_total(cons_entalpia,T_e_alta,Tc,presion_intermedia,Pc,w,R,1);

s_salida_alta_ideal=@(T)s_total(cons_entalpia,T,Tc,presion_vapor_condensador,Pc,w,R,1);

T_salida_ideal=raices_z(@(T)abs(s_entrada_alta-s_salida_alta_ideal(T)),T_s_condensador);

h_salida_alta_ideal=h_total(cons_entalpia,T_salida_ideal,Tc,presion_vapor_condensador,Pc,w,R,1);

W_alta_ideal=h_salida_alta_ideal-h_entrada_alta;

W_alta_real=W_alta_ideal/rendimiento;

h_salida_alta_real=W_alta_real+h_entrada_alta;

h_salida_alta=@(T_s)h_total(cons_entalpia,T_s,Tc,presion_vapor_condensador,Pc,w,R,1);

T_s_alta_real=raices_z(@(T)abs(h_salida_alta(T)-h_salida_alta_real),T_salida_ideal);

Potencia_compresor_alta=W_alta_real*caudal_compresor_alta;
