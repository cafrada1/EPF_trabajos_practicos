function [Error] = Ajuste_Virial(Parametros,B_exp,T,kb,Potencial,Nombre)
warning('off','all');
switch Potencial
    case "Pozo Cuadrado"
        funcion=@(Te)Pozo_Cuadrado(Parametros,Te,kb);
    case "Lennard Jones"
        funcion=@(Te)Lennard_Jones(Parametros,Te,kb,Nombre);
    case "Kihara"
        funcion=@(Te)Kihara(Parametros,Te,kb);
end
for i=1:length(T)
    
    B_ajuste(i,1)=funcion(T(i));

end

Error=sum(abs(B_ajuste-B_exp).^2);




