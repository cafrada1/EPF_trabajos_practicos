Potencial="Lennard Jones";
Compuesto="Nitrogeno";
%load(Compuesto+'.mat');
load(Compuesto+'.mat');
Temperatura=350;
P=0.1013;
R=8.3145;
kb=1.381*10^-23;

Inicio=[5*10^-21,3*10^-8];

func=@(Parametros)Ajuste_Virial(Parametros,B_Experimental,T,kb,Potencial,Compuesto);

[Parametros_Virial,error]=Minimizacion(func,Inicio);

B=Lennard_Jones(Parametros_Virial,Temperatura,kb,Compuesto);

B_T=Derivada_B(Parametros_Virial,Temperatura,kb,Compuesto);

Entropia=Entropia_Ideal(Compuesto,Temperatura,R,P)+Entropia_Residual(P,B_T);

Entalpia=Entalpia_Ideal(Compuesto,Temperatura,R)+Entalpia_Residual(P,Temperatura,B,B_T);

Phi=Coeficiente_Fugacidad(P,Temperatura,R,B);
