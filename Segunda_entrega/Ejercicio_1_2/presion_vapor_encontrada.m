function [presion_vapor] = presion_vapor_encontrada(R,Tc,Pc,w,T,P_semilla)

funcion=@(P)ajuste_presion_vapor(P,T,R,Tc,Pc,w);

presion_vapor=raices_z(funcion,P_semilla);

end

