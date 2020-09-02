function [delta_h] = h_vaporizacion(constantes,T,Tc)

delta_h=constantes(1)*exp(-constantes(2)*(T/Tc))*(1-(T/Tc))^constantes(3);
delta_h=delta_h*1000;
end

