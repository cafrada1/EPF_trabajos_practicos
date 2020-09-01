function [H_IG] = Entalpia_Ideal(Compuesto,T,R)

Constantes=Cp(Compuesto);

T_ref=298;

%cp=@(T)(R*Constantes(1)+Constantes(2).*T+Constantes(3).*T.^2+Constantes(4).*T.^-2);
cp=(R*(Constantes(1)+Constantes(2)*T+Constantes(3)*T^2+Constantes(4)*T^-2));

%H_IG=integral(cp,T_ref,T);
H_IG=cp*(T-T_ref);
end

