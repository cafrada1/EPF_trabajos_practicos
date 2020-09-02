function [temperatura] = temperatura_encontrada(R,Tc,Pc,w,P,semilla)



funcion=@(T)ajuste_temperatura(T,P,R,Tc,Pc,w);

temperatura=raices_z(funcion,semilla);

end