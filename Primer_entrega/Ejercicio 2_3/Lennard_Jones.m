function [B] = Lennard_Jones(Parametros,T,kb,Nombre)

N_A=6.02*10^23;
B=0;

funcion=@(r)(2*pi*N_A*(1-...
    exp(-(4*Parametros(1).*...
    ((Parametros(2)./(r)).^12-(Parametros(2)./(r)).^6)+(Parametros(1)/61.3))./...
    (T*kb))).*r.^2);
if Nombre=="Propano"
    B=B+quadgk(funcion,0,4.14*Parametros(2));
else
    
    B=B+quadgk(funcion,0,2.5*Parametros(2));
end
end


