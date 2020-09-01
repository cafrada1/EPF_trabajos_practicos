function [Area] = AreaTrapecios(Funcion_Evaluada,Valores_a_evaluar)

%{
Recibe:
        Funcion_Evaluada (Array) : Valores de las ordenadas.
        Valores_a_evaluar (Arrat) : Valores de las abscisas 
Devuele:
        Area (float) : Valor del area calculada mediante trapecios.
%}

Area=0;

%Usa trapecios para evaluar cada area del punto acutual y el proximo.
for i=2:length(Funcion_Evaluada)
   
    paso=Valores_a_evaluar(i)-Valores_a_evaluar(i-1);
    
    Area=Area+paso*(Funcion_Evaluada(i)+Funcion_Evaluada(i-1))/2;
    
end
end

