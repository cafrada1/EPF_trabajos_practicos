
Funcion_Ajustar_1=@(Constantes)Ajuste_Cuadratico_Antoine(Constantes,Temperaturas,Presiones_Saturacion_1);

Funcion_Ajustar_2=@(Constantes)Ajuste_Cuadratico_Antoine(Constantes,Temperaturas,Presiones_Saturacion_2);

inicio=[5,2000,200];
minimo=[-inf,-inf,-inf];
maximo=[inf,inf,inf];


Coeficientes_Antoine_1=Minimizacion(Funcion_Ajustar_1,inicio,minimo,maximo);

Coeficientes_Antoine_2=Minimizacion(Funcion_Ajustar_2,inicio,minimo,maximo);

%{
Presiones_Saturacion_1_Calculadas=Presion_Antoine(Coeficientes_Antoine_1,Temperaturas);

Presiones_Saturacion_2_Calculadas=Presion_Antoine(Coeficientes_Antoine_2,Temperaturas);


figure;
sz=20;

subplot(1,2,1);

hold on;

xlabel('Composicion x1');
ylabel('Presion (kPa)');

scatter(x1,Presiones_Saturacion_1,sz,'filled','red');
plot(x1,Presiones_Saturacion_1_Calculadas,"red");

subplot(1,2,2);

hold on;

xlabel('Composicion x1');
ylabel('Presion (kPa)');

scatter(x1,Presiones_Saturacion_2,sz,'filled','blue');
plot(x1,Presiones_Saturacion_2_Calculadas,'blue');

clear minimo maximo inicio Funcion_Ajustar_1 Funcion_Ajustar_2 sz
%}
clear Funcion_Ajustar_1 Funcion_Ajustar_2 maximo minimo inicio
