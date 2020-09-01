Potencial="Lennard Jones";
Nombre="Propano";
load(Nombre+'.mat');
format long

%Inicio=[5*10^-21,5*10^-8,1.1];
%Inicio=[5*10^-21,5*10^-8,12,6];
Inicio=[5*10^-21,1*10^-8];
func=@(Parametros)Ajuste_Virial(Parametros,B_Experimental,T,kb,Potencial);

[Parametros_Virial,error]=Minimizacion(func,Inicio);

clear  i