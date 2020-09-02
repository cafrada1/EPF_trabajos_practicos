function [entropia_total] = s_total(constantes,T,Tc,P,Pc,w,R,z)
entropia_ideal=s_ideal(constantes,T,P,R);
entropia_residual=s_residual(R,T,Tc,P,Pc,w,z);
entropia_total=entropia_ideal+entropia_residual;
end

