function [temperatura] = temperatura_encontrada(R,Tc,Pc,w,P)

T_inicial=300;

funcion=@(T)ajuste_temperatura(T,P,R,Tc,Pc,w);

temperatura=raices_z(funcion,T_inicial);

end