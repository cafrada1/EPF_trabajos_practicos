function [entropia_ideal] = s_ideal(constantes,T,P,R)

entropia_ideal=(constantes(2)*log(T)+2*constantes(3)*T+...
    3*constantes(4)*T^2/2+4*constantes(5)*T^3/3+5*constantes(6)*T^4/4)*44.1-R*log(P);

end

