
%Calculo de los Gamma experimentales sin considerar dilucion infinita.
[Gamma1_experimental,Gamma2_experimental]=Coef_Act(P,Presiones_Saturacion_1,Presiones_Saturacion_2,x1,y1);

Modelo="NRTL";
%Definicion de los valores para realizar el ajuste.
switch Modelo
    case "Margules"

        Minimo=-inf;
        Maximo=inf;
        Inicio=2000;
        
    case "Van Laar"
        
        Minimo=[-inf,-inf];
        Maximo=[inf,inf];
        Inicio=[2000,2000];
   
    case "Wilson"
        
        Minimo=[-inf,-inf];
        Maximo=[inf,inf];
        Inicio=[2,2];
        
    case "NRTL"
        
        Minimo=[0,-inf,-inf];
        Maximo=[1,inf,inf];
        Inicio=[0.3,2000,2000]; 
end

%%%%%%%%%%%%%%%%%%%%%%%%%% Ajuste Cuadratico %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Definicion de la funcion que se ajusta junto con el resto de valores necesarios para la misma.
funcion=@(Constantes)Ajuste_Cuadratico_Gamma...
    (Constantes,x1,Temperaturas,R,...
    P,Presiones_Saturacion_1,Presiones_Saturacion_2,Modelo);

%Calculo de los parametros que minimizan el ajuste junto con el error que producen. 
[Parametros_ajustados_Cuadratico,error_Cuadratico]=Minimizacion(funcion,Inicio,Minimo,Maximo);

%%%%%%%%%%%%%%%%%%%%%%%%% Graficos de cada Ajuste %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('NumberTitle','off');

%Resolucion de los graficos.

switch Modelo
    case "Margules"
        
        %Valores Ajuste Cuadratico.
        [Gamma1_teo_Cuadratico,Gamma2_teo_Cuadratico]=Margules1(Parametros_ajustados_Cuadratico,x1,Temperaturas,R);

    case "Van Laar"

        %Valores Ajuste Cuadratico.
        [Gamma1_teo_Cuadratico,Gamma2_teo_Cuadratico]=Van_Laar(Parametros_ajustados_Cuadratico,x1,Temperaturas,R);
    
    case "Wilson"

        %Valores Ajuste Cuadratico.
        [Gamma1_teo_Cuadratico,Gamma2_teo_Cuadratico]=Wilson(Parametros_ajustados_Cuadratico,x1);
            
    case "NRTL"

        %Valores Ajuste Cuadratico.
        [Gamma1_teo_Cuadratico,Gamma2_teo_Cuadratico]=NRTL(Parametros_ajustados_Cuadratico,x1,Temperaturas,R);
end

%%%%%%%%%%%%%%%%%% Graficos Ajuste Cuadratico %%%%%%%%%%%%%%%%%%%%%%%%%%%

title("Ajuste Cuadratico");

hold on;

sz=20;

%Valores experimentales graficados por puntos.
scatter(x1,log(Gamma1_experimental),sz,'filled')
scatter(x1,log(Gamma2_experimental),sz,'filled')

%Valores calculados con los parametros del ajuste.
plot(x1,log(Gamma1_teo_Cuadratico),'LineWidth',1.25)
plot(x1,log(Gamma2_teo_Cuadratico),'LineWidth',1.25)

title(Modelo)
xlabel("x1")
ylabel("ln(Gamma_i)")
legend('ln(Gamma1) exp','ln(Gamma2) exp','ln(Gamma1) calc','ln(Gamma2) calc','Location','north')
%Limpio las valiables que no voy a necesitar.
clear sz funcion Maximo Minimo Inicio 
