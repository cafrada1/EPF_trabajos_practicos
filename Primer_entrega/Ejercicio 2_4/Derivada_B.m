function [B_T] = Derivada_B(Parametros,T,kb,Nombre)

func=@(t)Lennard_Jones(Parametros,t,kb,Nombre);

B_T=(func(T-2)+func(T+1)*8-func(T-1)*8-func(T+2))/12;
end

