%{
1) Ajusta las constantes de margales respecto a los valores experimentales
2) Calcula los gamma para los valores ajustados. 
3) Calcula la presion de burbuja y la composicion del vapor para cada gamma.
4) Grafica los valores experimentales junto los obtenidos del ajuste.
%}
clear all;

load("Variables_Pentano_Propanal.mat");

Ajustes=["Gamma","P_Burbuja","G_exceso"];

%Graficos_presion=figure;
%Graficos_gamma=figure;

Modelo="Margules1";

for i=1:3
    parametro_a_ajustar=Ajustes(i);
    %Ajusta los parametros del modelo.
    Parametros_ajustes;

    %Define la resolucion de los graficos
    x1_calculado=0:0.01:1;

    %Calcula los gamma para los valores ajustados.
    switch Modelo
        case "Margules1"
            [Gamma1_calculado_Cuadratico,Gamma2_calculado_Cuadratico]=Margules1(Parametros_ajustados_Cuadratico,x1_calculado,T,R);

        case "Margules2"
            [Gamma1_calculado_Cuadratico,Gamma2_calculado_Cuadratico]=Margules2(Parametros_ajustados_Cuadratico,x1_calculado,T,R);

        case "Wilson"
            [Gamma1_calculado_Cuadratico,Gamma2_calculado_Cuadratico]=Wilson(Parametros_ajustados_Cuadratico,x1_calculado);
            
        case "Van Laar"
            [Gamma1_calculado_Cuadratico,Gamma2_calculado_Cuadratico]=Van_Laar(Parametros_ajustados_Cuadratico,x1_calculado,T,R);

        case "NRTL"
            [Gamma1_calculado_Cuadratico,Gamma2_calculado_Cuadratico]=NRTL(Parametros_ajustados_Cuadratico,x1_calculado,T,R);

    end

    %Calcula la presion de burbuja para los valores de gamma del modelo.
    Presiones_calculadas_Cuadratico=x1_calculado.*Gamma1_calculado_Cuadratico*Presiones_Saturacion(1)+(1-x1_calculado).*Gamma2_calculado_Cuadratico*Presiones_Saturacion(2);

    %Calcula las composiciones del vapor para los valores de gamma del modelo.
    y1_calculado_Cuadratico=x1_calculado.*Gamma1_calculado_Cuadratico*Presiones_Saturacion(1)./Presiones_calculadas_Cuadratico;

    %Graficos.
    figure('Name',parametro_a_ajustar,'NumberTitle','off');


    %%%%%%%%%%%%%%0 Ajuste Cuadratico %%%%%%%%%%%%%%%%%


    hold on;

    sz=20;

    %Valores experimentales graficados con puntos.
    scatter(x1,Presiones,sz,'filled','blue')
    scatter(y1,Presiones,sz,'filled','red')

    %Valores calculados con ajuste Cuadratico.
    plot(x1_calculado,Presiones_calculadas_Cuadratico,'blue','LineWidth',1.25)
    plot(y1_calculado_Cuadratico,Presiones_calculadas_Cuadratico,'red','LineWidth',1.25)
    
    
    title(Modelo)
    xlabel("x1/y1")
    ylabel("P (kPa)")
    legend('P rocio exp','P burbuja exp','P rocio calc','P burbuja calc','Location','southeast')
    %Limpio las variables que no voy a necesitar.
    clear sz
end
