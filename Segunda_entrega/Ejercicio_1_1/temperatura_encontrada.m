function [temperatura] = temperatura_encontrada(R,Tc,Pc,w,P,semilla_T)

funcion=@(P)ajuste_temperatura(T,P,R,Tc,Pc,w);

temperatura=raices_z(funcion,semilla_T);

end