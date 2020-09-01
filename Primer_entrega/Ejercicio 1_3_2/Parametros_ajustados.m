%{
1) Toma los valores experimentales y calcula los gamma de cada componente
2) Ajusta los parametros de margules a dos consantes que minizan los Gamma experimentales
3) Calcula los valores de la presion para los parametros ajustados.
4) Grafica los valores experimentales junto los obtenidos del ajuste.
%}

%Limpia los valores de Gamma almacenados previamente.
clear Gamma1 Gamma2

%Restringe los valores experimentales para no conciderar dilucion infinita.
Presiones_experimental=Presiones(2:end-1);
x1_experimental=x1(2:end-1);
y1_experimental=y1(2:end-1);

%Calculo de los Gamma experimentales sin considerar dilucion infinita.
[Gamma1_experimental,Gamma2_experimental]=Coef_Act(Presiones_experimental,Presiones_Saturacion,x1_experimental,y1_experimental);

%Definicion de los valores para realizar el ajuste.
switch Modelo
    case "Margules4"

        Inicio=[2000,2000,2000,2000];
               
    case "NRTL"
        Inicio=[0.3,-5000,7000]; 
end
%%%%%%%%%%%%%%%%%%%%%%%%%% Ajuste Cuadratico %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Definicion de la funcion que se ajusta junto con el resto de valores necesarios para la misma.
funcion=@(Constantes)AjusteCuadratico...
    (Constantes,Gamma1_experimental,Gamma2_experimental,x1_experimental,T,R,...
    Presiones_experimental,Presiones_Saturacion,parametro_a_ajustar,Modelo);

%Calculo de los parametros que minimizan el ajuste junto con el error que producen. 
[Parametros_ajustados_Cuadratico,error_Cuadratico]=Minimizacion(funcion,Inicio);

%%%%%%%%%%%%%%%%%%%%%%%%% Graficos de cada Ajuste %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name',parametro_a_ajustar,'NumberTitle','off');

%Resolucion de los graficos.
x1_grafico=0:0.05:1;

switch Modelo
    case "Margules4"
        %Valores Ajuste Cuadratico.
        [Gamma1_teo_Cuadratico,Gamma2_teo_Cuadratico]=Margules4(Parametros_ajustados_Cuadratico,x1_grafico,T,R);
   
    case "NRTL"
        %Valores Ajuste Cuadratico.
        [Gamma1_teo_Cuadratico,Gamma2_teo_Cuadratico]=NRTL(Parametros_ajustados_Cuadratico,x1_grafico,T,R);
end

%%%%%%%%%%%%%%%%%% Graficos Ajuste Cuadratico %%%%%%%%%%%%%%%%%%%%%%%%%%%
title(Modelo);

hold on;

sz=20;

%Valores experimentales graficados por puntos.
scatter(x1_experimental,log(Gamma1_experimental),sz,'filled')
scatter(x1_experimental,log(Gamma2_experimental),sz,'filled')

%Valores calculados con los parametros del ajuste.
plot(x1_grafico,log(Gamma1_teo_Cuadratico),'LineWidth',1.25)
plot(x1_grafico,log(Gamma2_teo_Cuadratico),'LineWidth',1.25)

xlabel("x1")
ylabel("ln(Gamma)")
legend('ln(Gamma1) exp','ln(Gamma2) exp','ln(Gamma1) calc','ln(Gamma2) calc','Location','north')

