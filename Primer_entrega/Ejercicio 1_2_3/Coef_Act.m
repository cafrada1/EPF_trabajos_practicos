function [Gamma1,Gamma2] = Coef_Act(P,Presiones_Saturacion_1,Presiones_Saturacion_2,x1,y1)

Gamma1=P.*y1./(x1.*Presiones_Saturacion_1);
Gamma2=P.*(1-y1)./((1-x1).*Presiones_Saturacion_2);

end

