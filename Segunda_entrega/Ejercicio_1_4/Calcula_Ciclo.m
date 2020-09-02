%%%%%%%%%Propano%%%%%%%%%%%%%%%%
load('propiedades_propano.mat');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%Agua&&&&&&&&&&&&&&&&&&&
c_agua=4.184; %kj/kg
T_e_agua_condensador=303;%kelvin
T_s_agua_condensador=303;%kelvin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%Generales%%%%%%%%%
%presion_intermedia=0.6;%MPa
DT=10;
Calor_evaporador=10000; %kw
T_evaporador=270; %kelvin
T_s_condensador=300; %kelvin
rendimiento=0.75;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Evaporador%
presion_vapor_evaporador=presion_vapor_encontrada(R,Tc,Pc,w,T_evaporador);

%Condensador%
presion_vapor_condensador=presion_vapor_encontrada(R,Tc,Pc,w,T_s_condensador);




h_condensador=h_total(cons_entalpia,T_s_condensador,Tc,presion_vapor_condensador,Pc,w,R,1)-...
    h_vaporizacion(cons_vaporizacion,T_s_condensador,Tc);

T_intermedia=temperatura_encontrada(R,Tc,Pc,w,presion_intermedia);

h_vapor_intermedia=h_total(cons_entalpia,T_intermedia,Tc,presion_intermedia,Pc,w,R,1);

h_liquido_intermedia=h_vapor_intermedia- h_vaporizacion(cons_vaporizacion,T_intermedia,Tc);

h_vapor_evaporador=h_total(cons_entalpia,T_evaporador,Tc,presion_vapor_evaporador,Pc,w,R,1);
h_liquido_evaporador=h_vapor_evaporador-h_vaporizacion(cons_vaporizacion,T_evaporador,Tc);

fracc_vap_baja=(h_liquido_intermedia-h_liquido_evaporador)/h_vaporizacion(cons_vaporizacion,T_evaporador,Tc);
fracc_vap_alta=(h_condensador-h_liquido_intermedia)/h_vaporizacion(cons_vaporizacion,T_intermedia,Tc);

caudal=Calor_evaporador/h_vaporizacion(cons_vaporizacion,T_evaporador,Tc);

caudal_compresor_baja=caudal/(1-fracc_vap_baja);
caudal_compresor_alta=caudal_compresor_baja/(1-fracc_vap_alta);

Calcula_compresor_baja;