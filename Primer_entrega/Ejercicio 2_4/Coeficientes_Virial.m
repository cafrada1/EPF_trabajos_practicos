%T=200:10:400;
%Param=[1.31143*10^-21,3.07*10^-8,1.69];
%Param=[1.31143*10^-21,3.07*10^-8];

switch Potencial
    case "Pozo Cuadrado"
        funcion=@(Parametros,T,kb)Pozo_Cuadrado(Parametros,T,kb);
    case "Lennard Jones"
        funcion=@(Parametros,T,kb)Lennard_Jones(Parametros,T,kb);
    case "Kihara"
        funcion=@(Parametros,T,kb)Kihara(Parametros,T,kb);
end
for i=1:length(T)
    
    %Coeficientes(i)=Pozo_Cuadrado(Param,T(i),kb);
    Coeficientes(i)=funcion(Parametros_Virial,T(i),kb);
end
figure
hold on;

plot(T,Coeficientes)
scatter(T,B_Experimental)
title(Nombre)
xlabel("B (cm^3/mol)")
ylabel("T (K)")
legend(Potencial,'Experimental','Location','northwest')

clear i
