function [B] = Kihara(Parametros,T,kb)

N_A=6.02*10^23;
B=0;

funcion=@(r)(2*pi*N_A.*r.^2);

B=B+quadgk(funcion,0,2*Parametros(3));

funcion=@(r)(2*pi*N_A*(1-...
    exp(-(4*Parametros(1).*...
    (((Parametros(2)-2*Parametros(3))./(r-2*Parametros(3))).^12-...
    ((Parametros(2)-2*Parametros(3))./(r-2*Parametros(3))).^6)./...
    (T*kb)))).*r.^2);

B=B+quadgk(funcion,2*Parametros(3),Inf);
end
