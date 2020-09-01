clear all;

load("Variables_Pentano_Acetona.mat");

Modelo="NRTL";

%Ajusta los parametros del modelo.
Ajuste_Parametros_Gamma;

Correlacion_Antoine;

%Define la resolucion de los graficos
x1_grafico=0:0.01:1;

%Calcula los gamma para los valores ajustados.
T_calculada=zeros(1,length(x1_grafico));
y1_calculado=zeros(1,length(x1_grafico));

for i=1:length(x1_grafico)
    
    inicio=300;
    minimo=100;
    maximo=1000;
    
    funcion=@(Temperatura)Ajuste_Temperatura(Temperatura,R,P,x1_grafico(i),Parametros_ajustados_Cuadratico,Coeficientes_Antoine_1,Coeficientes_Antoine_2,Modelo);

    [Temperatura_ajustada,error]=Minimizacion(funcion,inicio,minimo,maximo);
    
    T_calculada(i)=Temperatura_ajustada;
    
    switch Modelo

        case "Margules"

            [Gamma1,Gamma2]=Margules1(Parametros_ajustados_Cuadratico,x1_grafico(i),Temperatura_ajustada,R);
        
        case "Van Laar"

            [Gamma1,Gamma2]=Van_Laar(Parametros_ajustados_Cuadratico,x1_grafico(i),Temperatura_ajustada,R);

        case "Wilson"

            [Gamma1,Gamma2]=Wilson(Parametros_ajustados_Cuadratico,x1_grafico(i));

        case "NRTL"

            [Gamma1,Gamma2]=NRTL(Parametros_ajustados_Cuadratico,x1_grafico(i),Temperatura_ajustada,R);

    end
    y1_calculado(i)=x1_grafico(i)*Presion_Antoine(Coeficientes_Antoine_1,Temperatura_ajustada)*Gamma1/P;
end    

figure

hold on;
sz=20;
scatter(x1,Temperaturas,sz,'filled','blue');
plot(x1_grafico,T_calculada,'blue');

scatter(y1,Temperaturas,sz,'filled','red');
plot(y1_calculado,T_calculada,'red');

title(Modelo)
xlabel("x1/y1")
ylabel("T (K)")
legend('Tº rocio exp','Tº rocio calc','Tº buruja exp','Tº burbuja calc','Location','northeast')
