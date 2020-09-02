%Propano%
load('propiedades_propano.mat');

%Agua%
c_agua=4.184; %kj/kg
T_e_agua_condensador=298;%kelvin
T_s_agua_condensador=303;%kelvin


%Generales%
DT=10;
Calor_evaporador=10000; %kw
T_evaporador=270; %kelvin
T_s_condensador=T_s_agua_condensador+DT; %kelvin
rendimiento=0.75;


%Evaporador%
presion_vapor_evaporador=presion_vapor_encontrada(R,Tc,Pc,w,T_evaporador);%MPa

%Condensador%

presion_vapor_condensador=presion_vapor_encontrada(R,Tc,Pc,w,T_s_condensador);%MPa

lambda=h_vaporizacion(cons_vaporizacion,T_evaporador,Tc);%kj/kmol
caudal=Calor_evaporador/lambda;%kj/kmol
h_condensador=-h_vaporizacion(cons_vaporizacion,T_s_condensador,Tc)+...
    h_total(cons_entalpia,T_s_condensador,Tc,presion_vapor_condensador,Pc,w,R,1);%kj/kmol
h_liquido_flash=-lambda+h_total(cons_entalpia,T_evaporador,Tc,presion_vapor_evaporador,Pc,w,R,1);%kj/kmol
fraccion_vapor=(h_condensador-h_liquido_flash)/lambda;

%Compresor%
Calcula_Compresor;
Potencia=(caudal/(1-fraccion_vapor))*W;%kW
bhp=1.341*Potencia/rendimiento;
disp(Potencia)

Coef_COP=COP(Calor_evaporador,Potencia);
delta_s=s_total(cons_entalpia,T_s_real,Tc,presion_vapor_condensador,Pc,w,R,1)-...
    s_total(cons_entalpia,T_evaporador,Tc,presion_vapor_evaporador,Pc,w,R,1);

costo_equipos=costo_ciclo(0,0,bhp);
clear h_liquido_flash lambda T_e_agua_condensador 