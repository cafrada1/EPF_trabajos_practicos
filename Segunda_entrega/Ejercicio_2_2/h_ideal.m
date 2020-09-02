function [entalpia_ideal] = h_ideal(constantes,T)
format long
h_ref=-1.194e5;
entalpia_ideal=constantes(1)+constantes(2)*T+constantes(3)*T^2+...
    constantes(4)*T^3++constantes(5)*T^4+constantes(6)*T^5;
entalpia_ideal=h_ref+entalpia_ideal*44.1;
end

