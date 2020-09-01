
Funcion_Ajustar_1=@(Constantes)Ajuste_Cuadratico_Antoine(Constantes,Temperaturas,Presiones_Saturacion_1);

Funcion_Ajustar_2=@(Constantes)Ajuste_Cuadratico_Antoine(Constantes,Temperaturas,Presiones_Saturacion_2);

inicio=[5,2000,200];
minimo=[-inf,-inf,-inf];
maximo=[inf,inf,inf];


Coeficientes_Antoine_1=Minimizacion(Funcion_Ajustar_1,inicio,minimo,maximo);

Coeficientes_Antoine_2=Minimizacion(Funcion_Ajustar_2,inicio,minimo,maximo);

clear Funcion_Ajustar_1 Funcion_Ajustar_2 maximo minimo inicio
