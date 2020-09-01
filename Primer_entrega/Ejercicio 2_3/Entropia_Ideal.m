function [S_IG] = Entropia_Ideal(Compuesto,T,R,P)

Constantes=Cp(Compuesto);

T_ref=298;
P_ref=101.3;
%cp_T=@(T)(R*(Constantes(1)./T+Constantes(2)+Constantes(3).*T+Constantes(4).*T.^-3));
cp_T=(R*(Constantes(1)+Constantes(2)*T+Constantes(3)*T^2+Constantes(4)*T^-2));

%S_IG=integral(cp_T,T_ref,T)-R*log(P/P_ref);
S_IG=cp_T*log(T/T_ref)-R*log(P/P_ref);

end

