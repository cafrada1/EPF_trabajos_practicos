%Propano%
load('propiedades_propano.mat');

%Agua%
c_agua=4.184; %kj/kg
T_e_agua_condensador=298;%kelvin
grafico_potencia=[];
grafico_temp=[];
grafico_DT=[];
grafico_cop=[];
for i=1:20
    
    T_s_agua_condensador=280+i*2.5;%kelvin

    DT=10;
    Calor_evaporador=10000; %kw
    
    T_evaporador=240+i*5; %kelvin
    
    T_s_condensador=T_s_agua_condensador+DT; %kelvin
    presion_intermedia=0.46+0.02*i;
    rendimiento=0.75;
    presion_intermedia_grafico(i)=presion_intermedia;
    Calcula_Ciclo;
    grafico_potencia_alta(i)=Potencia_compresor_alta;
    grafico_potencia_baja(i)=Potencia_compresor_baja;
    grafico_costo(i)=costo_ciclo(grafico_potencia_alta(i))+costo_ciclo(grafico_potencia_baja(i));
    grafico_potencia_total(i)=Potencia_compresor_alta+Potencia_compresor_baja;
    
end   
figure
hold on
plot(presion_intermedia_grafico,grafico_potencia_alta)
plot(presion_intermedia_grafico,grafico_potencia_baja)
plot(presion_intermedia_grafico,grafico_potencia_total)
scatter(presion_intermedia_grafico,grafico_potencia_total)
figure
plot(presion_intermedia_grafico,grafico_costo)