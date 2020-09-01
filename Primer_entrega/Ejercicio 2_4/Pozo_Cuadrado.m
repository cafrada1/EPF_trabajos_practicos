function [B] = Pozo_Cuadrado(Parametros,T,kb)
N_A=6.02*10^23;
B=0;
funcion=@(r)((1-exp(-inf/(T*kb))).*r.^2);
B=B+quadgk(funcion,0,Parametros(2));

funcion=@(r)((1-exp(Parametros(1)/(T*kb))).*r.^2);
B=B+quadgk(funcion,Parametros(2),Parametros(2)*Parametros(3));

funcion=@(r)((1-exp(0/(T*kb))).*r.^2);
B=B+quadgk(funcion,Parametros(3)*Parametros(2),inf);
B=B*2*pi*N_A;
end

