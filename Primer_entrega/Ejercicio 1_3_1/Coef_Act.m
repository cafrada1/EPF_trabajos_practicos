function [Gamma1,Gamma2] = Coef_Act(P,Presiones_Saturacion,x1,y1)

%{
Recibe:
        P (Array) : Las presiones experimentales del sistema.
        Presiones_Saturacion (Arrat) : Presion de saturacion del componente 1 y el componente 2 respectivamente.
        x1 (Array) : Las composiciones experimentales en el liquido del componente 1.
        y1 (Array) : Las composiciones experimentales en el vapor del componente 1.
        caso (Boolean) : Define si se realiza la extrapolacion.
Devuelve:
        [Gamma1,Gamma2] (Array) : Los coeficientes de actividad de cada componente.           
%}

Gamma1=zeros(length(x1),1);

Gamma2=zeros(length(x1),1);

%{
Realiza un ciclo for para calcular cada Gamma experimental 
salvo los casos de dilucion infinita.
%} 

for i=1:length(x1)

    if x1(i)~=0 && x1(i)~=1

       Gamma1(i)=P(i)*y1(i)/(x1(i)*Presiones_Saturacion(1));

       Gamma2(i)=P(i)*(1-y1(i))/((1-x1(i))*Presiones_Saturacion(2));

    end
end
end

