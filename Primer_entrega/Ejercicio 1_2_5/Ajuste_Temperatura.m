function [Error] = Ajuste_Temperatura(Temperatura,R,Presion,x1,Parametros_modelo,Coef_Antoine_1,Coef_Antoine_2,Modelo)

Presion_Sat_1=Presion_Antoine(Coef_Antoine_1,Temperatura);

Presion_Sat_2=Presion_Antoine(Coef_Antoine_2,Temperatura);

switch Modelo

    case "Margules"
        
        [Gamma1,Gamma2]=Margules1(Parametros_modelo,x1,Temperatura,R);

    case "Van Laar"
        
        [Gamma1,Gamma2]=Van_Laar(Parametros_modelo,x1,Temperatura,R);

    case "Wilson"
        
        [Gamma1,Gamma2]=Wilson(Parametros_modelo,x1);

    case "NRTL"

        [Gamma1,Gamma2]=NRTL(Parametros_modelo,x1,Temperatura,R);

end

Error=abs(Presion-x1*Presion_Sat_1*Gamma1-(1-x1)*Presion_Sat_2*Gamma2);

end

