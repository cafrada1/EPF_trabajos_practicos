function [H_R] =Entalpia_Residual(P,T,B,B_T)

H_R=P*B-B_T*P*T;

end

