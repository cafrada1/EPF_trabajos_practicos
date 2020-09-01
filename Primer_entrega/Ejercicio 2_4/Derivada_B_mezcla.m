function [B_T_mezcla] = Derivada_B_mezcla(Parametros_1,Parametros_2,Parametros_12,T,kb,y1,Nombre1,Nombre2)

func_mezcla=@(T)(Lennard_Jones(Parametros_1,T,kb,Nombre1)*y1^2+...
    Lennard_Jones(Parametros_2,T,kb,Nombre2)*(1-y1)^2+...
    2*Lennard_Jones(Parametros_12,T,kb,Nombre1)*y1*(1-y1));

B_T_mezcla=(func_mezcla(T-2)+func_mezcla(T+1)*8-func_mezcla(T-1)*8-func_mezcla(T+2))/12;

end

