%Propano%
load('propiedades_propano.mat');

%Agua%
c_agua=4.184; %kj/kg
T_e_agua_condensador=298;%kelvin
grafico_potencia=[];
grafico_temp=[];
grafico_DT=[];
grafico_cop=[];
for i=1:10
    
    T_s_agua_condensador=280+i*5;%kelvin

    %Generales%
    %DT=i*5;
    DT=10;
    Calor_evaporador=10000; %kw
    
    T_evaporador=240+i*5; %kelvin
    
    T_s_condensador=T_s_agua_condensador+DT; %kelvin
    
    rendimiento=0.75;

    Calcula_Ciclo;
    grafico_potencia(i)=Potencia;
    %grafico_temp(i)=T_s_condensador;
    %grafico_DT(i)=DT;
    grafico_evap(i)=T_evaporador;
    grafico_cop(i)=Coef_COP;
    
end   
figure
hold on
plot(grafico_potencia,grafico_cop)