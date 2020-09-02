function [v] = volumen_molar(R,Tc,Pc,w,T,P_semilla,z0)

P=presion_vapor_encontrada(R,Tc,Pc,w,T,P_semilla);

z=factor_z(R,T,Tc,P,Pc,w,z0);

v=z*(R*T)/P;

end

