function [entalpia_total] = h_total(constantes,T,Tc,P,Pc,w,R,z)

entalpia_ideal=h_ideal(constantes,T);
entalpia_residual=h_residual(R,T,Tc,P,Pc,w,z);
entalpia_total=entalpia_ideal+entalpia_residual;

end

