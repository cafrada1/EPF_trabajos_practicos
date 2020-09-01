function [Error] = Ajuste_Cuadratico_Gamma(Constantes,x1,T,R,Presion,Presiones_Saturacion_1,Presiones_Saturacion_2,Modelo)

switch Modelo
    
    case "Margules"

        [G1_teorico,G2_teorico]=Margules1(Constantes,x1,T,R);

    case "Van Laar"

        [G1_teorico,G2_teorico]=Van_Laar(Constantes,x1,T,R);
    
    case "Wilson"

        [G1_teorico,G2_teorico]=Wilson(Constantes,x1);

    case "NRTL"

        [G1_teorico,G2_teorico]=NRTL(Constantes,x1,T,R);

end

Error=sum((Presion-(x1.*G1_teorico.*Presiones_Saturacion_1+(1-x1).*G2_teorico.*Presiones_Saturacion_2)).^2); 
        
end
