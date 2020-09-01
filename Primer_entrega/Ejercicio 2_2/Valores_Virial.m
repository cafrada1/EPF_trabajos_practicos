Potencial="Lennard Jones";
Nombre="Propano";
load(Nombre+'.mat');
format long

switch Potencial
    case "Pozo Cuadrado"
        Inicio=[5*10^-21,5*10^-8,1.1];
    case "Lennard Jones"
        Inicio=[200,3*10^-8];
    case "Kihara"
        Inicio=[5*10^-21,5*10^-8,5*10^-9];
end

func=@(Parametros)Ajuste_Virial(Parametros,B_Experimental,T,kb,Potencial);

[Parametros_Virial,error]=Minimizacion(func,Inicio);

clear  i